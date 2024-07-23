# Local Data Lake Project

## Overview

This project demonstrates how to set up a local data lake system for extracting, transforming, and loading data, and querying it using a SQL engine. It showcases the integration of various technologies to create a flexible and powerful data processing environment.

## Technologies Used

- Docker: For containerization and easy setup of services
- Mage: Data pipeline orchestrator
- Apache Spark: For data processing and transformations
- MinIO: S3-compatible object store serving as our data lake
- Apache Iceberg: Advanced table format for data lakes
- StarRocks: High-performance analytical database for querying data

## Prerequisites

- Docker and Docker Compose
- Basic understanding of data engineering concepts
- Familiarity with Python and SQL

## Setup

1. Clone the repository
2. Create a `.env` file with MinIO credentials:
   ```
   MINIO_ACCESS_KEY=choose_a_key
   MINIO_SECRET_KEY=choose_a_secret
   ```
3. Build the Docker image:
   ```
   make build
   ```
4. Start the services:
   ```
   make up
   ```
5. Access the Mage UI:
   ```
   make browse
   ```

## Project Structure

- `Dockerfile`: Configures the Mage environment with Spark
- `docker-compose.yaml`: Defines services (Mage, StarRocks, MinIO)
- `Makefile`: Simplifies common commands
- `requirements.txt`: Python dependencies
- `mage_demo/`: Main project directory
  - `spark-config/`: JAR files for Spark configuration
  - `utils/`: Utility scripts (e.g., Spark session factory)
  - `data/`: Directory for storing sample data

## Usage

1. Place your CSV data files in the `mage_demo/data/` directory
2. Run the Mage pipeline to process and store data in MinIO using Apache Iceberg format
3. Use StarRocks to query the data:
   - Create an external catalog
   - Set the Iceberg catalog
   - Use SQL to query and analyze the data

## Example Query

```sql
SELECT 
  neighbourhood, 
  count(*) as no_reviews
FROM listings 
WHERE reviews ='5.0'
GROUP BY 1
ORDER BY COUNT(*) DESC
```

## Extending the Project

- Add more complex data transformations in Mage pipelines
- Implement Delta Lake alongside Apache Iceberg
- Explore advanced features of StarRocks for data analysis

## Contributing

Contributions to improve the project are welcome. Please follow the standard fork-and-pull request workflow.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

This project was inspired by the need for a simple, local data lake setup for learning and development purposes.
