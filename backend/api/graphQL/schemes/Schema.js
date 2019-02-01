
import {
    GraphQLObjectType,
    GraphQLNonNull,
    GraphQLSchema,
    GraphQLString,
    GraphQLList,
    GraphQLInt,
    GraphQLBoolean
  } from 'graphql/type';

  import userController from '../../controllers/userController'
  
  /**
   * generate projection object for mongoose
   * @param  {Object} fieldASTs
   * @return {Project}
   */
  export function getProjection (fieldASTs) {
    return fieldASTs.fieldNodes[0].selectionSet.selections.reduce((projections, selection) => {
      projections[selection.name.value] = true;
      return projections;
    }, {});
  }
  
  var userType = new GraphQLObjectType({
    name: 'user',
    description: 'user data',
    fields: () => ({
        name:{
            type: (GraphQLString),
            description: 'Name of the User.',
        },
      
        username: {
            type: (GraphQLString),
            description: 'username of User.',
        },

        password: {
            type: GraphQLString,
            description: 'User Password',
        }
    })
  });
  
  var schema = new GraphQLSchema({
    query: new GraphQLObjectType({
      name: 'userQueryType',
      fields: {
        user: {
          type: new GraphQLList(userType)
        //   args: {
        //     userName: {
        //       name: 'userName',
        //       type: new GraphQLNonNull(GraphQLString)
        //     }
          },
          resolve: (root, {userName}, source, fieldASTs) => {
            var projections = getProjection(fieldASTs);
            var foundItems = new Promise((resolve, reject) => {
                userController.all({}, projections,(err, users) => {
                    err ? reject(err) : resolve(users)
                })
            })
  
            return foundItems
          }
        }
      }
    })
  });
  
  export default schema;