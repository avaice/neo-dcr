export const formatHealthCheck = ({ requestFrom }: { requestFrom: string }) => {
	return { status: "ok", requestFrom };
};
