import { OrderWhereUniqueInput } from "../../generated/prisma-client";
import { Context } from "../../utils";

export default {
    createOrder: (parent, args, ctx: Context) => ctx.prisma.createOrder(args.data),
    updateOrder: (parent, args: { data: any, where: any }, ctx: Context) => ctx.prisma.updateOrder(args),
    deleteOrder: (parent,args:{where: OrderWhereUniqueInput},ctx: Context) => ctx.prisma.deleteOrder({id:args.where.id}),
}