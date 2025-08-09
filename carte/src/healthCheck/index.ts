import type { Context } from "hono";
import { formatHealthCheck } from "./interactors/formatHealthCheck";

const controller = (c: Context) => {
	const requestFrom = c.req.header("x-request-from") || "unknown";
	throw new Error("Health check failed");
	return c.json(formatHealthCheck({ requestFrom }));
};

export default controller;
