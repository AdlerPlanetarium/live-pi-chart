module.exports =
  bucket: 'adler-staging'
  prefix: 'live-pi-chart'
  local: './public/build'
  key: process.env.ADLER_AWS_ACCESS_KEY_ID
  secret: process.env.ADLER_AWS_SECRET_ACCESS_KEY
