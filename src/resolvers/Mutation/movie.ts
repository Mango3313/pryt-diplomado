import { MovieWhereUniqueInput } from "../../generated/prisma-client";
import { Context } from "../../utils";

export default {
    createMovie: (parent, args, ctx: Context) => ctx.prisma.createMovie(args.data),
    updateOrder: (parent, args: { data: any, where: any }, ctx: Context) => ctx.prisma.updateMovie(args),
    deleteOrder: (parent,args:{where: MovieWhereUniqueInput},ctx: Context) => ctx.prisma.deleteMovie({id:args.where.id}),
}