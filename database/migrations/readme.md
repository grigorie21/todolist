## Schemes
- log
- public
- ref

## Order of performing migrations:
- 0000 - schemes
- 1000 - data types
- 1100 - static reference (ref scheme)
- 1200 - dynamic references, which are needed in statically dynamic references (ref scheme)
- 1300 - static-dynamic reference (ref scheme)
- 1400 - dynamic directories (public schema)
- 1500 - connections (public scheme)
- 1600 - logs (log scheme)
- 1700 - views (public schema)
- 1800 - tables of third party libraries
