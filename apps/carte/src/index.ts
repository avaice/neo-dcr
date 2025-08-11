import { serve } from '@hono/node-server'
import { Hono } from 'hono'

const app = new Hono()

app.get('/', (c) => {
  return c.text('Hello CARTE!')
})

serve({
  fetch: app.fetch,
  port: 8082
}, (info) => {
  console.log(`Server is running on http://localhost:${info.port}`)
})
