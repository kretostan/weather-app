import * as path from "node:path";
import tailwindcss from "@tailwindcss/vite";
import react from "@vitejs/plugin-react-swc";
import { defineConfig, loadEnv } from "vite";

// https://vite.dev/config/
export default defineConfig(({ command, mode }) => {
	const env = loadEnv(mode, process.cwd());

	if (command === "serve" && !env.VITE_API_URL)
		throw new Error("VITE_API_URL is required for the development proxy");

	return {
		plugins: [react(), tailwindcss()],
		server: {
			host: true,
			port: 5173,
			proxy: {
				"/api": {
					target: env.VITE_API_URL,
					changeOrigin: true,
				},
			},
		},
		resolve: {
			alias: {
				"@": path.resolve(__dirname, "./src"),
			},
		},
	};
});
