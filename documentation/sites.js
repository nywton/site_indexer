/**
 * @api {get} /sites 1 - Get All
 * @apiVersion 0.1.0
 * @apiName GetSites
 * @apiGroup Sites
 *
 * @apiDescription Returns a list of sites with indexed tags
 *
 *
 * @apiExample Example usage:
 * curl http://localhost:3000/sites
 *
 * @apiSuccess {Number}     id              The -ID.
 * @apiSuccess {Number}     url  Indexed DOM source
 *
 *
 * @apiSuccessExample Response (example):
 * HTTP/1.1 200 OK
 *  {
   "data":[
      {
         "id":"1",
         "type":"sites",
         "links":{
            "self":"http://localhost:3000/sites/1"
         },
         "attributes":{
            "url":"https://nywton.herokuapp.com"
         },
         "relationships":{
            "tags":{
               "links":{
                  "self":"http://localhost:3000/sites/1/relationships/tags",
                  "related":"http://localhost:3000/sites/1/tags"
               }
            }
         }
      }
   ]
}
 *
 *  @apiSampleRequest http://site-indexer.herokuapp.com/sites
 */

/**
 * @api {post} /sites - Index a site
 * @apiVersion 0.1.0
 * @apiName Sites
 *
 * @apiDescription Create a index object from document provided by url.
 *
 * @apiParam {url} document web address.
 *
 * @apiExample Example usage:
 * curl -d '{"data": {"type":"sites", "attributes":{"url":"https://nywton.herokuapp.com"}}}' -X POST -H "Content-Type: application/vnd.api+json" http://localhost:3000/site
 *
 *
 *
 * @apiSuccessExample Response (example):
 *     HTTP/1.1 201 Created
 *     {
 *       "resource":{
 *         "id":3,
 *         "url":"https://nywton.herokuapp.com",
 *         "created_at":"2019-04-05T06:37:19.819Z",
 *         "updated_at":"2019-04-05T06:37:19.819Z"
 *        },
 *       "code":"created",
 *       "options":{
 *
 *       },
 *       "meta":{
 *
 *        },
 *        "links":{
 *
 *         }
 *      }
 *
 *
 *
 */
