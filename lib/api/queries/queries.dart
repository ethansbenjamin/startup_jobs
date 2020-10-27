const fetchJobs = r'''
query GetJobs() {
    jobs {
      id,
      title,
      locationNames,
      isFeatured
      applyUrl
    }
  }

''';
