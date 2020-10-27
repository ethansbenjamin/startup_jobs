import 'package:flutter/material.dart';
import 'package:flutter_graphql_bloc/api/models/models.dart';
import 'package:flutter_graphql_bloc/pages/pages.dart';

class JobCard extends StatelessWidget {
  const JobCard({this.job});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(job.description);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => JobDetail(job: job)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .9,
        margin: EdgeInsets.all(8),
        height: 80,
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 10,
              child: Icon(
                job.isFeatured == true ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
            ),
            Positioned(
              top: 25,
              left: 50,
              child: Text(
                job.title ?? "",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Text(
                job.locationNames ?? "",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// return ListTile(
//                     key: Key(job.id),
//                     leading: Icon(Icons.computer),
//                     title: Text(job.title),
//                     trailing: Icon(
//                       job.isFeatured == true ? Icons.star : Icons.star_border,
//                       color: Colors.orangeAccent,
//                     ),
//                     subtitle: job.locationNames != null
//                         ? Text(job.locationNames)
//                         : null,
//                   );
