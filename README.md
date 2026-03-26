# COBOL REST API Documentation

## Overview
This repository contains a REST API documentation and implementation guide for Computer Science projects using COBOL. COBOL (Common Business-Oriented Language) is a powerful language for business applications and enterprise systems.

## What is COBOL?
COBOL is a compiled English-like programming language designed for business applications. It remains widely used in banking, insurance, and government sectors for mission-critical systems.

### Key Characteristics:
- **Readable**: English-like syntax makes it accessible to programmers
- **Reliable**: Proven stability in production environments for decades
- **Scalable**: Designed to handle large data processing tasks
- **Maintainable**: Clear structure facilitates long-term maintenance

## REST API Endpoints

### Base URL
```
http://api.cobol-service.local/v1
```

### Authentication
All endpoints require Bearer token authentication:
```
Authorization: Bearer YOUR_API_TOKEN
```

## Available Endpoints

### 1. Get COBOL Program Information
**Endpoint:** `GET /programs/{program_id}`

**Description:** Retrieve information about a specific COBOL program

**Parameters:**
- `program_id` (string, required): The unique identifier of the COBOL program

**Response:**
```json
{
  "id": "prog-001",
  "name": "Payroll Processing System",
  "language": "COBOL",
  "version": "1.0.0",
  "last_modified": "2026-03-20T10:30:00Z",
  "status": "active"
}
```

**Status Codes:**
- `200 OK`: Successfully retrieved
- `404 Not Found`: Program not found
- `401 Unauthorized`: Invalid authentication

### 2. Compile COBOL Code
**Endpoint:** `POST /compile`

**Description:** Compile COBOL source code

**Request Body:**
```json
{
  "source_code": "IDENTIFICATION DIVISION. PROGRAM-ID. HELLO...",
  "compiler": "GnuCOBOL",
  "output_format": "executable"
}
```

**Response:**
```json
{
  "compilation_id": "comp-12345",
  "status": "success",
  "executable_path": "/bin/programs/hello",
  "warnings": [],
  "timestamp": "2026-03-26T14:25:00Z"
}
```

**Status Codes:**
- `200 OK`: Compilation successful
- `400 Bad Request`: Invalid source code
- `422 Unprocessable Entity`: Compilation errors

### 3. Execute COBOL Program
**Endpoint:** `POST /execute`

**Description:** Execute a compiled COBOL program with input parameters

**Request Body:**
```json
{
  "program_id": "prog-001",
  "input_data": {
    "employee_id": "EMP123",
    "salary": 50000
  },
  "timeout_seconds": 30
}
```

**Response:**
```json
{
  "execution_id": "exec-67890",
  "program_id": "prog-001",
  "status": "completed",
  "output": "Processing complete. Records processed: 1500",
  "execution_time_ms": 245,
  "timestamp": "2026-03-26T14:30:00Z"
}
```

**Status Codes:**
- `200 OK`: Execution completed
- `408 Request Timeout`: Program execution exceeded timeout
- `500 Internal Server Error`: Runtime error

### 4. List All Programs
**Endpoint:** `GET /programs`

**Description:** Retrieve a list of all COBOL programs

**Query Parameters:**
- `limit` (integer, optional): Maximum number of results (default: 20)
- `offset` (integer, optional): Pagination offset (default: 0)
- `status` (string, optional): Filter by status (active, inactive, archived)

**Response:**
```json
{
  "programs": [
    {
      "id": "prog-001",
      "name": "Payroll Processing System",
      "status": "active"
    },
    {
      "id": "prog-002",
      "name": "Account Management System",
      "status": "active"
    }
  ],
  "total": 2,
  "limit": 20,
  "offset": 0
}
```

**Status Codes:**
- `200 OK`: Successfully retrieved
- `401 Unauthorized`: Invalid authentication

### 5. Get Program Execution History
**Endpoint:** `GET /programs/{program_id}/history`

**Description:** Retrieve execution history for a specific COBOL program

**Response:**
```json
{
  "program_id": "prog-001",
  "executions": [
    {
      "execution_id": "exec-67890",
      "status": "completed",
      "timestamp": "2026-03-26T14:30:00Z",
      "execution_time_ms": 245
    }
  ],
  "total_executions": 1
}
```

**Status Codes:**
- `200 OK`: Successfully retrieved
- `404 Not Found`: Program not found

## Error Handling

All errors follow the standard error response format:

```json
{
  "error": "Invalid Request",
  "error_code": "ERR_001",
  "message": "The provided program_id is invalid",
  "timestamp": "2026-03-26T14:35:00Z"
}
```

### Common Error Codes
- `ERR_001`: Invalid Request
- `ERR_002`: Authentication Failed
- `ERR_003`: Program Not Found
- `ERR_004`: Compilation Error
- `ERR_005`: Runtime Error
- `ERR_006`: Timeout Error

## Rate Limiting

The API implements rate limiting to ensure fair usage:
- **Rate Limit:** 1000 requests per hour per API token
- **Headers:** 
  - `X-RateLimit-Limit`: Total requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `X-RateLimit-Reset`: Timestamp when limit resets

## Getting Started

### Prerequisites
- API Token (obtain from admin panel)
- COBOL knowledge or familiarity with the language
- HTTP client (curl, Postman, etc.)

### Example: Compile and Execute

```bash
# Step 1: Compile COBOL Code
curl -X POST http://api.cobol-service.local/v1/compile \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "source_code": "IDENTIFICATION DIVISION. PROGRAM-ID. HELLO. PROCEDURE DIVISION. DISPLAY \"Hello, COBOL!\". STOP RUN.",
    "compiler": "GnuCOBOL"
  }'

# Step 2: Execute the Program
curl -X POST http://api.cobol-service.local/v1/execute \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "program_id": "prog-001",
    "timeout_seconds": 30
  }'
```

## COBOL Best Practices

1. **Code Organization**: Use clear section divisions (IDENTIFICATION, ENVIRONMENT, DATA, PROCEDURE)
2. **Variable Naming**: Use descriptive names following organizational standards
3. **Error Handling**: Implement proper error checking and logging
4. **Performance**: Optimize file I/O and database operations
5. **Documentation**: Maintain clear comments and documentation

## Resources

- [GnuCOBOL Official Documentation](https://gnucobol.sourceforge.io/)
- [COBOL Standards - ISO/IEC 1989](https://www.iso.org/standard/74942.html)
- [Modern COBOL Programming](https://moderncobolprogramming.com/)

## Support

For issues, questions, or contributions:
- Create an issue in this repository
- Contact: support@cobol-api.local
- Documentation: https://docs.cobol-api.local

## License

This project is licensed under the MIT License - see LICENSE file for details

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

**Last Updated:** 2026-03-26 10:55:12
**Version:** 1.0.0
**Maintainer:** tarciostudy-hub