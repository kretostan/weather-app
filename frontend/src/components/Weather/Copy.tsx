const Copy = ({ mark }: { mark: boolean }) => {
	return (
		<img
			src={mark ? "/check.svg" : "/copy.svg"}
			alt={mark ? "Copied weather" : "Copy weather"}
			className="h-5 w-5"
		/>
	);
};

export default Copy;
