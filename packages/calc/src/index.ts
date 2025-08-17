import prisma from 'database';

async function main() {
	// DBからOrganizationを1件取得して表示する例
	const org = await prisma.organization.findFirst();
	console.log('Organization:', org);
}

main().catch(console.error);