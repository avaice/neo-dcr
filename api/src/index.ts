import { serve } from "@hono/node-server";
import { Hono } from "hono";
import healthCheck from "./healthCheck";

var app = new Hono();

app.onError((error, c) => {
	return c.json({ error: error.message }, 500);
});

app.notFound((c) => {
	return c.json({ error: "Not Found" }, 404);
});

app.get("/", (c) => {
	return c.text("api server");
});

app.get("/health", healthCheck);

serve(
	{
		fetch: app.fetch,
		port: 3000,
	},
	(info) => {
		console.log(`Server is running on http://localhost:${info.port}`);
	},
);
