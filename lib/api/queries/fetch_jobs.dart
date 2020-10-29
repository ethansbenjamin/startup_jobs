const fetchJobs = r'''
query GetJobs() {
     jobs {
      id,
      title,
      locationNames,
      isFeatured
        applyUrl
     description
      company{
        name
        logoUrl
        websiteUrl
      }
    }
  }

''';
