import 'package:flutter_graphql_bloc/api/api.dart';
import 'package:flutter_graphql_bloc/api/queries/queries.dart' as queries;
import 'package:graphql/client.dart';

class FetchJobsRequestFailure implements Exception {}

class ApiClient {
  // we pass an instance a graphql client to our api client to create a level of abstraction
  const ApiClient({GraphQLClient graphQLClient})
      : assert(graphQLClient != null),
        _graphQLClient = graphQLClient;

// create our graphql client
  factory ApiClient.create() {
    final httpLink = HttpLink(uri: "https://api.graphql.jobs");
    final link = Link.from([httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(cache: InMemoryCache(), link: link),
    );
  }
  // instance of a graphql client
  final GraphQLClient _graphQLClient;

  Future<List<Job>> fetchJobs() async {
    // query the data from the jobs api
    final result = await _graphQLClient.query(
      QueryOptions(
        // use the query from the query file
        documentNode: gql(queries.fetchJobs),
      ),
    );
    // if the result has an exception, throw an error and do not return data
    if (result.hasException) {
      throw FetchJobsRequestFailure();
    }
    // get the data as a list
    final data = result.data['jobs'] as List;
    // return a list of Jobs
    return data.map((job) => Job.fromJson(job)).toList();
  }
}
