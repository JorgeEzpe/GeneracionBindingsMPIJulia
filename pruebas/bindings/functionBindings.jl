# Auto-generated file

function check(code::Cint)
    if code != 0
        error("MPI error: return code = $code")
    end
end

MPI_Init()=MPI_Init(Ref{Cint}(0), Ptr{Ptr{Ptr{Cchar}}}(0))

Base.cconvert(::Type{MPIPtr}, x::Ref) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Ref) = reinterpret(MPIPtr, Base.unsafe_convert(Ptr{Cvoid}, x))
Base.cconvert(::Type{MPIPtr}, x::Ptr) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Ptr) = reinterpret(MPIPtr, x)
Base.cconvert(::Type{MPIPtr}, x::Vector) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Vector) = reinterpret(MPIPtr, pointer(x))
Base.cconvert(::Type{MPIPtr}, x::Matrix) = x
Base.unsafe_convert(::Type{MPIPtr}, x::Matrix) = reinterpret(MPIPtr, pointer(x))

function MPI_Abort(comm::C_MPI_Comm, errorcode::C_int)::C_int
    return ccall((:MPI_Abort, "libmpi"), C_int, (C_MPI_Comm, C_int), comm, errorcode)
end

function MPI_Accumulate(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, op::C_MPI_Op, win::C_MPI_Win)::C_int
    return ccall((:MPI_Accumulate, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Win), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, op, win)
end

function MPI_Add_error_class(errorclass::ArgPtr{C_int})::C_int
    return ccall((:MPI_Add_error_class, "libmpi"), C_int, (MPIPtr,), errorclass)
end

function MPI_Add_error_code(errorclass::C_int, errorcode::ArgPtr{C_int})::C_int
    return ccall((:MPI_Add_error_code, "libmpi"), C_int, (C_int, MPIPtr), errorclass, errorcode)
end

function MPI_Add_error_string(errorcode::C_int, string::ArgPtr{C_char})::C_int
    return ccall((:MPI_Add_error_string, "libmpi"), C_int, (C_int, MPIPtr), errorcode, string)
end

function MPI_Allgather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Allgather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm)
end

function MPI_Allgatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Allgatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm)
end

function MPI_Alloc_mem(size::C_MPI_Aint, info::C_MPI_Info, baseptr)::C_int
    return ccall((:MPI_Alloc_mem, "libmpi"), C_int, (C_MPI_Aint, C_MPI_Info, MPIPtr), size, info, baseptr)
end

function MPI_Allreduce(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Allreduce, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm), sendbuf, recvbuf, count, datatype, op, comm)
end

function MPI_Alltoall(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Alltoall, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm)
end

function MPI_Alltoallv(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Alltoallv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm)
end

function MPI_Alltoallw(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtypes::ArgPtr{C_MPI_Datatype}, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtypes::ArgPtr{C_MPI_Datatype}, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Alltoallw, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_MPI_Comm), sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm)
end

function MPI_Attr_delete(comm::C_MPI_Comm, MPI2::C_int)::C_int
    return ccall((:MPI_Attr_delete, "libmpi"), C_int, (C_MPI_Comm, C_int), comm, MPI2)
end

function MPI_Attr_get(comm::C_MPI_Comm, keyval::C_int, attribute_val, MPI2::ArgPtr{C_int})::C_int
    return ccall((:MPI_Attr_get, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr), comm, keyval, attribute_val, MPI2)
end

function MPI_Attr_put(comm::C_MPI_Comm, keyval::C_int, MPI2)::C_int
    return ccall((:MPI_Attr_put, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr), comm, keyval, MPI2)
end

function MPI_Barrier(comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Barrier, "libmpi"), C_int, (C_MPI_Comm,), comm)
end

function MPI_Bcast(buffer, count::C_int, datatype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Bcast, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm), buffer, count, datatype, root, comm)
end

function MPI_Bsend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Bsend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm), buf, count, datatype, dest, tag, comm)
end

function MPI_Bsend_init(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Bsend_init, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Buffer_attach(buffer, size::C_int)::C_int
    return ccall((:MPI_Buffer_attach, "libmpi"), C_int, (MPIPtr, C_int), buffer, size)
end

function MPI_Buffer_detach(buffer, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Buffer_detach, "libmpi"), C_int, (MPIPtr, MPIPtr), buffer, size)
end

function MPI_Cancel(request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Cancel, "libmpi"), C_int, (MPIPtr,), request)
end

function MPI_Cart_coords(comm::C_MPI_Comm, rank::C_int, maxdims::C_int, coords::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cart_coords, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, MPIPtr), comm, rank, maxdims, coords)
end

function MPI_Cart_create(old_comm::C_MPI_Comm, ndims::C_int, dims::ArgPtr{C_int}, periods::ArgPtr{C_int}, reorder::C_int, comm_cart::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Cart_create, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, C_int, MPIPtr), old_comm, ndims, dims, periods, reorder, comm_cart)
end

function MPI_Cart_get(comm::C_MPI_Comm, maxdims::C_int, dims::ArgPtr{C_int}, periods::ArgPtr{C_int}, coords::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cart_get, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, MPIPtr), comm, maxdims, dims, periods, coords)
end

function MPI_Cart_map(comm::C_MPI_Comm, ndims::C_int, dims::ArgPtr{C_int}, periods::ArgPtr{C_int}, newrank::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cart_map, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, MPIPtr), comm, ndims, dims, periods, newrank)
end

function MPI_Cart_rank(comm::C_MPI_Comm, coords::ArgPtr{C_int}, rank::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cart_rank, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr), comm, coords, rank)
end

function MPI_Cart_shift(comm::C_MPI_Comm, direction::C_int, disp::C_int, rank_source::ArgPtr{C_int}, rank_dest::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cart_shift, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, MPIPtr, MPIPtr), comm, direction, disp, rank_source, rank_dest)
end

function MPI_Cart_sub(comm::C_MPI_Comm, remain_dims::ArgPtr{C_int}, new_comm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Cart_sub, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr), comm, remain_dims, new_comm)
end

function MPI_Cartdim_get(comm::C_MPI_Comm, ndims::ArgPtr{C_int})::C_int
    return ccall((:MPI_Cartdim_get, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, ndims)
end

function MPI_Close_port(port_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Close_port, "libmpi"), C_int, (MPIPtr,), port_name)
end

function MPI_Comm_accept(port_name::ArgPtr{C_char}, info::C_MPI_Info, root::C_int, comm::C_MPI_Comm, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_accept, "libmpi"), C_int, (MPIPtr, C_MPI_Info, C_int, C_MPI_Comm, MPIPtr), port_name, info, root, comm, newcomm)
end

function MPI_Comm_call_errhandler(comm::C_MPI_Comm, errorcode::C_int)::C_int
    return ccall((:MPI_Comm_call_errhandler, "libmpi"), C_int, (C_MPI_Comm, C_int), comm, errorcode)
end

function MPI_Comm_compare(comm1::C_MPI_Comm, comm2::C_MPI_Comm, result::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_compare, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Comm, MPIPtr), comm1, comm2, result)
end

function MPI_Comm_connect(port_name::ArgPtr{C_char}, info::C_MPI_Info, root::C_int, comm::C_MPI_Comm, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_connect, "libmpi"), C_int, (MPIPtr, C_MPI_Info, C_int, C_MPI_Comm, MPIPtr), port_name, info, root, comm, newcomm)
end

function MPI_Comm_create(comm::C_MPI_Comm, group::C_MPI_Group, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_create, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Group, MPIPtr), comm, group, newcomm)
end

function MPI_Comm_create_errhandler(_function::Ptr{Cvoid}, errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_Comm_create_errhandler, "libmpi"), C_int, (MPIPtr, MPIPtr), _function, errhandler)
end

function MPI_Comm_create_group(comm::C_MPI_Comm, group::C_MPI_Group, tag::C_int, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_create_group, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Group, C_int, MPIPtr), comm, group, tag, newcomm)
end

function MPI_Comm_create_keyval(comm_copy_attr_fn::Ptr{Cvoid}, comm_delete_attr_fn::Ptr{Cvoid}, comm_keyval::ArgPtr{C_int}, extra_state)::C_int
    return ccall((:MPI_Comm_create_keyval, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr), comm_copy_attr_fn, comm_delete_attr_fn, comm_keyval, extra_state)
end

function MPI_Comm_delete_attr(comm::C_MPI_Comm, comm_keyval::C_int)::C_int
    return ccall((:MPI_Comm_delete_attr, "libmpi"), C_int, (C_MPI_Comm, C_int), comm, comm_keyval)
end

function MPI_Comm_disconnect(comm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_disconnect, "libmpi"), C_int, (MPIPtr,), comm)
end

function MPI_Comm_dup(comm::C_MPI_Comm, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_dup, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, newcomm)
end

function MPI_Comm_dup_with_info(comm::C_MPI_Comm, info::C_MPI_Info, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_dup_with_info, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Info, MPIPtr), comm, info, newcomm)
end

function MPI_Comm_free(comm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_free, "libmpi"), C_int, (MPIPtr,), comm)
end

function MPI_Comm_free_keyval(comm_keyval::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_free_keyval, "libmpi"), C_int, (MPIPtr,), comm_keyval)
end

function MPI_Comm_get_attr(comm::C_MPI_Comm, comm_keyval::C_int, attribute_val, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_get_attr, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr), comm, comm_keyval, attribute_val, flag)
end

function MPI_Comm_get_errhandler(comm::C_MPI_Comm, erhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_Comm_get_errhandler, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, erhandler)
end

function MPI_Comm_get_info(comm::C_MPI_Comm, info_used::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_Comm_get_info, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, info_used)
end

function MPI_Comm_get_name(comm::C_MPI_Comm, comm_name::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_get_name, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr), comm, comm_name, resultlen)
end

function MPI_Comm_get_parent(parent::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_get_parent, "libmpi"), C_int, (MPIPtr,), parent)
end

function MPI_Comm_group(comm::C_MPI_Comm, group::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Comm_group, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, group)
end

function MPI_Comm_idup(comm::C_MPI_Comm, newcomm::ArgPtr{C_MPI_Comm}, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Comm_idup, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr), comm, newcomm, request)
end

function MPI_Comm_join(fd::C_int, intercomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_join, "libmpi"), C_int, (C_int, MPIPtr), fd, intercomm)
end

function MPI_Comm_rank(comm::C_MPI_Comm, rank::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_rank, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, rank)
end

function MPI_Comm_remote_group(comm::C_MPI_Comm, group::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Comm_remote_group, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, group)
end

function MPI_Comm_remote_size(comm::C_MPI_Comm, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_remote_size, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, size)
end

function MPI_Comm_set_attr(comm::C_MPI_Comm, comm_keyval::C_int, attribute_val)::C_int
    return ccall((:MPI_Comm_set_attr, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr), comm, comm_keyval, attribute_val)
end

function MPI_Comm_set_errhandler(comm::C_MPI_Comm, errhandler::C_MPI_Errhandler)::C_int
    return ccall((:MPI_Comm_set_errhandler, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Errhandler), comm, errhandler)
end

function MPI_Comm_set_info(comm::C_MPI_Comm, info::C_MPI_Info)::C_int
    return ccall((:MPI_Comm_set_info, "libmpi"), C_int, (C_MPI_Comm, C_MPI_Info), comm, info)
end

function MPI_Comm_set_name(comm::C_MPI_Comm, comm_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Comm_set_name, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, comm_name)
end

function MPI_Comm_size(comm::C_MPI_Comm, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_size, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, size)
end

function MPI_Comm_spawn(command::ArgPtr{C_char}, argv::Ptr{Ptr{C_char}}, maxprocs::C_int, info::C_MPI_Info, root::C_int, comm::C_MPI_Comm, intercomm::ArgPtr{C_MPI_Comm}, array_of_errcodes::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_spawn, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Info, C_int, C_MPI_Comm, MPIPtr, MPIPtr), command, argv, maxprocs, info, root, comm, intercomm, array_of_errcodes)
end

function MPI_Comm_spawn_multiple(count::C_int, array_of_commands::Ptr{Ptr{C_char}}, array_of_argv::Ptr{Ptr{Ptr{C_char}}}, array_of_maxprocs::ArgPtr{C_int}, array_of_info::ArgPtr{C_MPI_Info}, root::C_int, comm::C_MPI_Comm, intercomm::ArgPtr{C_MPI_Comm}, array_of_errcodes::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_spawn_multiple, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_int, C_MPI_Comm, MPIPtr, MPIPtr), count, array_of_commands, array_of_argv, array_of_maxprocs, array_of_info, root, comm, intercomm, array_of_errcodes)
end

function MPI_Comm_split(comm::C_MPI_Comm, color::C_int, key::C_int, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_split, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, MPIPtr), comm, color, key, newcomm)
end

function MPI_Comm_split_type(comm::C_MPI_Comm, split_type::C_int, key::C_int, info::C_MPI_Info, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Comm_split_type, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, C_MPI_Info, MPIPtr), comm, split_type, key, info, newcomm)
end

function MPI_Comm_test_inter(comm::C_MPI_Comm, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Comm_test_inter, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, flag)
end

function MPI_Compare_and_swap(origin_addr, compare_addr, result_addr, datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, win::C_MPI_Win)::C_int
    return ccall((:MPI_Compare_and_swap, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_int, C_MPI_Aint, C_MPI_Win), origin_addr, compare_addr, result_addr, datatype, target_rank, target_disp, win)
end

function MPI_Dims_create(nnodes::C_int, ndims::C_int, dims::ArgPtr{C_int})::C_int
    return ccall((:MPI_Dims_create, "libmpi"), C_int, (C_int, C_int, MPIPtr), nnodes, ndims, dims)
end

function MPI_Dist_graph_create(comm_old::C_MPI_Comm, n::C_int, nodes::ArgPtr{C_int}, degrees::ArgPtr{C_int}, targets::ArgPtr{C_int}, weights::ArgPtr{C_int}, info::C_MPI_Info, reorder::C_int, newcomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Dist_graph_create, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_MPI_Info, C_int, MPIPtr), comm_old, n, nodes, degrees, targets, weights, info, reorder, newcomm)
end

function MPI_Dist_graph_create_adjacent(comm_old::C_MPI_Comm, indegree::C_int, sources::ArgPtr{C_int}, sourceweights::ArgPtr{C_int}, outdegree::C_int, destinations::ArgPtr{C_int}, destweights::ArgPtr{C_int}, info::C_MPI_Info, reorder::C_int, comm_dist_graph::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Dist_graph_create_adjacent, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, C_int, MPIPtr, MPIPtr, C_MPI_Info, C_int, MPIPtr), comm_old, indegree, sources, sourceweights, outdegree, destinations, destweights, info, reorder, comm_dist_graph)
end

function MPI_Dist_graph_neighbors(comm::C_MPI_Comm, maxindegree::C_int, sources::ArgPtr{C_int}, sourceweights::ArgPtr{C_int}, maxoutdegree::C_int, destinations::ArgPtr{C_int}, destweights::ArgPtr{C_int})::C_int
    return ccall((:MPI_Dist_graph_neighbors, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, C_int, MPIPtr, MPIPtr), comm, maxindegree, sources, sourceweights, maxoutdegree, destinations, destweights)
end

function MPI_Dist_graph_neighbors_count(comm::C_MPI_Comm, inneighbors::ArgPtr{C_int}, outneighbors::ArgPtr{C_int}, weighted::ArgPtr{C_int})::C_int
    return ccall((:MPI_Dist_graph_neighbors_count, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr, MPIPtr), comm, inneighbors, outneighbors, weighted)
end

function MPI_Errhandler_free(errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_Errhandler_free, "libmpi"), C_int, (MPIPtr,), errhandler)
end

function MPI_Error_class(errorcode::C_int, errorclass::ArgPtr{C_int})::C_int
    return ccall((:MPI_Error_class, "libmpi"), C_int, (C_int, MPIPtr), errorcode, errorclass)
end

function MPI_Error_string(errorcode::C_int, string::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Error_string, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr), errorcode, string, resultlen)
end

function MPI_Exscan(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Exscan, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm), sendbuf, recvbuf, count, datatype, op, comm)
end

function MPI_Fetch_and_op(origin_addr, result_addr, datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, op::C_MPI_Op, win::C_MPI_Win)::C_int
    return ccall((:MPI_Fetch_and_op, "libmpi"), C_int, (MPIPtr, MPIPtr, C_MPI_Datatype, C_int, C_MPI_Aint, C_MPI_Op, C_MPI_Win), origin_addr, result_addr, datatype, target_rank, target_disp, op, win)
end

function MPI_File_call_errhandler(fh::C_MPI_File, errorcode::C_int)::C_int
    return ccall((:MPI_File_call_errhandler, "libmpi"), C_int, (C_MPI_File, C_int), fh, errorcode)
end

function MPI_File_close(fh::ArgPtr{C_MPI_File})::C_int
    return ccall((:MPI_File_close, "libmpi"), C_int, (MPIPtr,), fh)
end

function MPI_File_create_errhandler(_function::Ptr{Cvoid}, errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_File_create_errhandler, "libmpi"), C_int, (MPIPtr, MPIPtr), _function, errhandler)
end

function MPI_File_delete(filename::ArgPtr{C_char}, info::C_MPI_Info)::C_int
    return ccall((:MPI_File_delete, "libmpi"), C_int, (MPIPtr, C_MPI_Info), filename, info)
end

function MPI_File_get_amode(fh::C_MPI_File, amode::ArgPtr{C_int})::C_int
    return ccall((:MPI_File_get_amode, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, amode)
end

function MPI_File_get_atomicity(fh::C_MPI_File, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_File_get_atomicity, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, flag)
end

function MPI_File_get_byte_offset(fh::C_MPI_File, offset::C_MPI_Offset, disp::ArgPtr{C_MPI_Offset})::C_int
    return ccall((:MPI_File_get_byte_offset, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr), fh, offset, disp)
end

function MPI_File_get_errhandler(file::C_MPI_File, errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_File_get_errhandler, "libmpi"), C_int, (C_MPI_File, MPIPtr), file, errhandler)
end

function MPI_File_get_group(fh::C_MPI_File, group::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_File_get_group, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, group)
end

function MPI_File_get_info(fh::C_MPI_File, info_used::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_File_get_info, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, info_used)
end

function MPI_File_get_position(fh::C_MPI_File, offset::ArgPtr{C_MPI_Offset})::C_int
    return ccall((:MPI_File_get_position, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, offset)
end

function MPI_File_get_position_shared(fh::C_MPI_File, offset::ArgPtr{C_MPI_Offset})::C_int
    return ccall((:MPI_File_get_position_shared, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, offset)
end

function MPI_File_get_size(fh::C_MPI_File, size::ArgPtr{C_MPI_Offset})::C_int
    return ccall((:MPI_File_get_size, "libmpi"), C_int, (C_MPI_File, MPIPtr), fh, size)
end

function MPI_File_get_type_extent(fh::C_MPI_File, datatype::C_MPI_Datatype, extent::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_File_get_type_extent, "libmpi"), C_int, (C_MPI_File, C_MPI_Datatype, MPIPtr), fh, datatype, extent)
end

function MPI_File_get_view(fh::C_MPI_File, disp::ArgPtr{C_MPI_Offset}, etype::ArgPtr{C_MPI_Datatype}, filetype::ArgPtr{C_MPI_Datatype}, datarep::ArgPtr{C_char})::C_int
    return ccall((:MPI_File_get_view, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr, MPIPtr, MPIPtr), fh, disp, etype, filetype, datarep)
end

function MPI_File_iread(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iread, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_iread_all(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iread_all, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_iread_at(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iread_at, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, request)
end

function MPI_File_iread_at_all(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iread_at_all, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, request)
end

function MPI_File_iread_shared(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iread_shared, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_iwrite(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iwrite, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_iwrite_all(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iwrite_all, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_iwrite_at(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iwrite_at, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, request)
end

function MPI_File_iwrite_at_all(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iwrite_at_all, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, request)
end

function MPI_File_iwrite_shared(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_File_iwrite_shared, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, request)
end

function MPI_File_open(comm::C_MPI_Comm, filename::ArgPtr{C_char}, amode::C_int, info::C_MPI_Info, fh::ArgPtr{C_MPI_File})::C_int
    return ccall((:MPI_File_open, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, C_int, C_MPI_Info, MPIPtr), comm, filename, amode, info, fh)
end

function MPI_File_preallocate(fh::C_MPI_File, size::C_MPI_Offset)::C_int
    return ccall((:MPI_File_preallocate, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset), fh, size)
end

function MPI_File_read(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_read_all(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_all, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_read_all_begin(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_read_all_begin, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype), fh, buf, count, datatype)
end

function MPI_File_read_all_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_all_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_read_at(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_at, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, status)
end

function MPI_File_read_at_all(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_at_all, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, status)
end

function MPI_File_read_at_all_begin(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_read_at_all_begin, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype), fh, offset, buf, count, datatype)
end

function MPI_File_read_at_all_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_at_all_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_read_ordered(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_ordered, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_read_ordered_begin(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_read_ordered_begin, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype), fh, buf, count, datatype)
end

function MPI_File_read_ordered_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_ordered_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_read_shared(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_read_shared, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_seek(fh::C_MPI_File, offset::C_MPI_Offset, whence::C_int)::C_int
    return ccall((:MPI_File_seek, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, C_int), fh, offset, whence)
end

function MPI_File_seek_shared(fh::C_MPI_File, offset::C_MPI_Offset, whence::C_int)::C_int
    return ccall((:MPI_File_seek_shared, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, C_int), fh, offset, whence)
end

function MPI_File_set_atomicity(fh::C_MPI_File, flag::C_int)::C_int
    return ccall((:MPI_File_set_atomicity, "libmpi"), C_int, (C_MPI_File, C_int), fh, flag)
end

function MPI_File_set_errhandler(file::C_MPI_File, errhandler::C_MPI_Errhandler)::C_int
    return ccall((:MPI_File_set_errhandler, "libmpi"), C_int, (C_MPI_File, C_MPI_Errhandler), file, errhandler)
end

function MPI_File_set_info(fh::C_MPI_File, info::C_MPI_Info)::C_int
    return ccall((:MPI_File_set_info, "libmpi"), C_int, (C_MPI_File, C_MPI_Info), fh, info)
end

function MPI_File_set_size(fh::C_MPI_File, size::C_MPI_Offset)::C_int
    return ccall((:MPI_File_set_size, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset), fh, size)
end

function MPI_File_set_view(fh::C_MPI_File, disp::C_MPI_Offset, etype::C_MPI_Datatype, filetype::C_MPI_Datatype, datarep::ArgPtr{C_char}, info::C_MPI_Info)::C_int
    return ccall((:MPI_File_set_view, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, C_MPI_Datatype, C_MPI_Datatype, MPIPtr, C_MPI_Info), fh, disp, etype, filetype, datarep, info)
end

function MPI_File_sync(fh::C_MPI_File)::C_int
    return ccall((:MPI_File_sync, "libmpi"), C_int, (C_MPI_File,), fh)
end

function MPI_File_write(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_write_all(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_all, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_write_all_begin(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_write_all_begin, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype), fh, buf, count, datatype)
end

function MPI_File_write_all_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_all_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_write_at(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_at, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, status)
end

function MPI_File_write_at_all(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_at_all, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, offset, buf, count, datatype, status)
end

function MPI_File_write_at_all_begin(fh::C_MPI_File, offset::C_MPI_Offset, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_write_at_all_begin, "libmpi"), C_int, (C_MPI_File, C_MPI_Offset, MPIPtr, C_int, C_MPI_Datatype), fh, offset, buf, count, datatype)
end

function MPI_File_write_at_all_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_at_all_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_write_ordered(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_ordered, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_File_write_ordered_begin(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype)::C_int
    return ccall((:MPI_File_write_ordered_begin, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype), fh, buf, count, datatype)
end

function MPI_File_write_ordered_end(fh::C_MPI_File, buf, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_ordered_end, "libmpi"), C_int, (C_MPI_File, MPIPtr, MPIPtr), fh, buf, status)
end

function MPI_File_write_shared(fh::C_MPI_File, buf, count::C_int, datatype::C_MPI_Datatype, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_File_write_shared, "libmpi"), C_int, (C_MPI_File, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), fh, buf, count, datatype, status)
end

function MPI_Finalize()::C_int
    return ccall((:MPI_Finalize, "libmpi"), C_int, (), )
end

function MPI_Finalized(flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Finalized, "libmpi"), C_int, (MPIPtr,), flag)
end

function MPI_Free_mem(base)::C_int
    return ccall((:MPI_Free_mem, "libmpi"), C_int, (MPIPtr,), base)
end

function MPI_Gather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Gather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm)
end

function MPI_Gatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Gatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_int, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm)
end

function MPI_Get(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, win::C_MPI_Win)::C_int
    return ccall((:MPI_Get, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Win), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, win)
end

function MPI_Get_accumulate(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, result_addr, result_count::C_int, result_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, op::C_MPI_Op, win::C_MPI_Win)::C_int
    return ccall((:MPI_Get_accumulate, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Win), origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win)
end

function MPI_Get_address(location, address::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_Get_address, "libmpi"), C_int, (MPIPtr, MPIPtr), location, address)
end

function MPI_Get_count(status::ArgPtr{C_MPI_Status}, datatype::C_MPI_Datatype, count::ArgPtr{C_int})::C_int
    return ccall((:MPI_Get_count, "libmpi"), C_int, (MPIPtr, C_MPI_Datatype, MPIPtr), status, datatype, count)
end

function MPI_Get_elements(status::ArgPtr{C_MPI_Status}, datatype::C_MPI_Datatype, count::ArgPtr{C_int})::C_int
    return ccall((:MPI_Get_elements, "libmpi"), C_int, (MPIPtr, C_MPI_Datatype, MPIPtr), status, datatype, count)
end

function MPI_Get_elements_x(status::ArgPtr{C_MPI_Status}, datatype::C_MPI_Datatype, count::ArgPtr{C_MPI_Count})::C_int
    return ccall((:MPI_Get_elements_x, "libmpi"), C_int, (MPIPtr, C_MPI_Datatype, MPIPtr), status, datatype, count)
end

function MPI_Get_library_version(version::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Get_library_version, "libmpi"), C_int, (MPIPtr, MPIPtr), version, resultlen)
end

function MPI_Get_processor_name(name::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Get_processor_name, "libmpi"), C_int, (MPIPtr, MPIPtr), name, resultlen)
end

function MPI_Get_version(version::ArgPtr{C_int}, subversion::ArgPtr{C_int})::C_int
    return ccall((:MPI_Get_version, "libmpi"), C_int, (MPIPtr, MPIPtr), version, subversion)
end

function MPI_Graph_create(comm_old::C_MPI_Comm, nnodes::C_int, index::ArgPtr{C_int}, edges::ArgPtr{C_int}, reorder::C_int, comm_graph::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Graph_create, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, C_int, MPIPtr), comm_old, nnodes, index, edges, reorder, comm_graph)
end

function MPI_Graph_get(comm::C_MPI_Comm, maxindex::C_int, maxedges::C_int, index::ArgPtr{C_int}, edges::ArgPtr{C_int})::C_int
    return ccall((:MPI_Graph_get, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, MPIPtr, MPIPtr), comm, maxindex, maxedges, index, edges)
end

function MPI_Graph_map(comm::C_MPI_Comm, nnodes::C_int, index::ArgPtr{C_int}, edges::ArgPtr{C_int}, newrank::ArgPtr{C_int})::C_int
    return ccall((:MPI_Graph_map, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr, MPIPtr, MPIPtr), comm, nnodes, index, edges, newrank)
end

function MPI_Graph_neighbors(comm::C_MPI_Comm, rank::C_int, maxneighbors::C_int, neighbors::ArgPtr{C_int})::C_int
    return ccall((:MPI_Graph_neighbors, "libmpi"), C_int, (C_MPI_Comm, C_int, C_int, MPIPtr), comm, rank, maxneighbors, neighbors)
end

function MPI_Graph_neighbors_count(comm::C_MPI_Comm, rank::C_int, nneighbors::ArgPtr{C_int})::C_int
    return ccall((:MPI_Graph_neighbors_count, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr), comm, rank, nneighbors)
end

function MPI_Graphdims_get(comm::C_MPI_Comm, nnodes::ArgPtr{C_int}, nedges::ArgPtr{C_int})::C_int
    return ccall((:MPI_Graphdims_get, "libmpi"), C_int, (C_MPI_Comm, MPIPtr, MPIPtr), comm, nnodes, nedges)
end

function MPI_Grequest_complete(request::C_MPI_Request)::C_int
    return ccall((:MPI_Grequest_complete, "libmpi"), C_int, (C_MPI_Request,), request)
end

function MPI_Grequest_start(query_fn::Ptr{Cvoid}, free_fn::Ptr{Cvoid}, cancel_fn::Ptr{Cvoid}, extra_state, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Grequest_start, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr), query_fn, free_fn, cancel_fn, extra_state, request)
end

function MPI_Group_compare(group1::C_MPI_Group, group2::C_MPI_Group, result::ArgPtr{C_int})::C_int
    return ccall((:MPI_Group_compare, "libmpi"), C_int, (C_MPI_Group, C_MPI_Group, MPIPtr), group1, group2, result)
end

function MPI_Group_difference(group1::C_MPI_Group, group2::C_MPI_Group, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_difference, "libmpi"), C_int, (C_MPI_Group, C_MPI_Group, MPIPtr), group1, group2, newgroup)
end

function MPI_Group_excl(group::C_MPI_Group, n::C_int, ranks::ArgPtr{C_int}, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_excl, "libmpi"), C_int, (C_MPI_Group, C_int, MPIPtr, MPIPtr), group, n, ranks, newgroup)
end

function MPI_Group_free(group::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_free, "libmpi"), C_int, (MPIPtr,), group)
end

function MPI_Group_incl(group::C_MPI_Group, n::C_int, ranks::ArgPtr{C_int}, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_incl, "libmpi"), C_int, (C_MPI_Group, C_int, MPIPtr, MPIPtr), group, n, ranks, newgroup)
end

function MPI_Group_intersection(group1::C_MPI_Group, group2::C_MPI_Group, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_intersection, "libmpi"), C_int, (C_MPI_Group, C_MPI_Group, MPIPtr), group1, group2, newgroup)
end

function MPI_Group_range_excl(group::C_MPI_Group, n::C_int, ranges3::Ptr{Cvoid}, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_range_excl, "libmpi"), C_int, (C_MPI_Group, C_int, MPIPtr, MPIPtr), group, n, ranges3, newgroup)
end

function MPI_Group_range_incl(group::C_MPI_Group, n::C_int, ranges3::Ptr{Cvoid}, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_range_incl, "libmpi"), C_int, (C_MPI_Group, C_int, MPIPtr, MPIPtr), group, n, ranges3, newgroup)
end

function MPI_Group_rank(group::C_MPI_Group, rank::ArgPtr{C_int})::C_int
    return ccall((:MPI_Group_rank, "libmpi"), C_int, (C_MPI_Group, MPIPtr), group, rank)
end

function MPI_Group_size(group::C_MPI_Group, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Group_size, "libmpi"), C_int, (C_MPI_Group, MPIPtr), group, size)
end

function MPI_Group_translate_ranks(group1::C_MPI_Group, n::C_int, ranks1::ArgPtr{C_int}, group2::C_MPI_Group, ranks2::ArgPtr{C_int})::C_int
    return ccall((:MPI_Group_translate_ranks, "libmpi"), C_int, (C_MPI_Group, C_int, MPIPtr, C_MPI_Group, MPIPtr), group1, n, ranks1, group2, ranks2)
end

function MPI_Group_union(group1::C_MPI_Group, group2::C_MPI_Group, newgroup::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Group_union, "libmpi"), C_int, (C_MPI_Group, C_MPI_Group, MPIPtr), group1, group2, newgroup)
end

function MPI_Iallgather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iallgather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request)
end

function MPI_Iallgatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iallgatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm, request)
end

function MPI_Iallreduce(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iallreduce, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, count, datatype, op, comm, request)
end

function MPI_Ialltoall(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ialltoall, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request)
end

function MPI_Ialltoallv(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ialltoallv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, request)
end

function MPI_Ialltoallw(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtypes::ArgPtr{C_MPI_Datatype}, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtypes::ArgPtr{C_MPI_Datatype}, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ialltoallw, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_MPI_Comm, MPIPtr), sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, request)
end

function MPI_Ibarrier(comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ibarrier, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, request)
end

function MPI_Ibcast(buffer, count::C_int, datatype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ibcast, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm, MPIPtr), buffer, count, datatype, root, comm, request)
end

function MPI_Ibsend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ibsend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Iexscan(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iexscan, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, count, datatype, op, comm, request)
end

function MPI_Igather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Igather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request)
end

function MPI_Igatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Igatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_int, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, request)
end

function MPI_Improbe(source::C_int, tag::C_int, comm::C_MPI_Comm, flag::ArgPtr{C_int}, message::ArgPtr{C_MPI_Message}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Improbe, "libmpi"), C_int, (C_int, C_int, C_MPI_Comm, MPIPtr, MPIPtr, MPIPtr), source, tag, comm, flag, message, status)
end

function MPI_Imrecv(buf, count::C_int, type::C_MPI_Datatype, message::ArgPtr{C_MPI_Message}, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Imrecv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr), buf, count, type, message, request)
end

function MPI_Ineighbor_allgather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ineighbor_allgather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request)
end

function MPI_Ineighbor_allgatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ineighbor_allgatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm, request)
end

function MPI_Ineighbor_alltoall(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ineighbor_alltoall, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request)
end

function MPI_Ineighbor_alltoallv(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ineighbor_alltoallv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm, MPIPtr), sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, request)
end

function MPI_Ineighbor_alltoallw(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_MPI_Aint}, sendtypes::ArgPtr{C_MPI_Datatype}, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_MPI_Aint}, recvtypes::ArgPtr{C_MPI_Datatype}, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ineighbor_alltoallw, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_MPI_Comm, MPIPtr), sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, request)
end

function MPI_Info_create(info::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_Info_create, "libmpi"), C_int, (MPIPtr,), info)
end

function MPI_Info_delete(info::C_MPI_Info, key::ArgPtr{C_char})::C_int
    return ccall((:MPI_Info_delete, "libmpi"), C_int, (C_MPI_Info, MPIPtr), info, key)
end

function MPI_Info_dup(info::C_MPI_Info, newinfo::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_Info_dup, "libmpi"), C_int, (C_MPI_Info, MPIPtr), info, newinfo)
end

function MPI_Info_free(info::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_Info_free, "libmpi"), C_int, (MPIPtr,), info)
end

function MPI_Info_get(info::C_MPI_Info, key::ArgPtr{C_char}, valuelen::C_int, value::ArgPtr{C_char}, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Info_get, "libmpi"), C_int, (C_MPI_Info, MPIPtr, C_int, MPIPtr, MPIPtr), info, key, valuelen, value, flag)
end

function MPI_Info_get_nkeys(info::C_MPI_Info, nkeys::ArgPtr{C_int})::C_int
    return ccall((:MPI_Info_get_nkeys, "libmpi"), C_int, (C_MPI_Info, MPIPtr), info, nkeys)
end

function MPI_Info_get_nthkey(info::C_MPI_Info, n::C_int, key::ArgPtr{C_char})::C_int
    return ccall((:MPI_Info_get_nthkey, "libmpi"), C_int, (C_MPI_Info, C_int, MPIPtr), info, n, key)
end

function MPI_Info_get_valuelen(info::C_MPI_Info, key::ArgPtr{C_char}, valuelen::ArgPtr{C_int}, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Info_get_valuelen, "libmpi"), C_int, (C_MPI_Info, MPIPtr, MPIPtr, MPIPtr), info, key, valuelen, flag)
end

function MPI_Info_set(info::C_MPI_Info, key::ArgPtr{C_char}, value::ArgPtr{C_char})::C_int
    return ccall((:MPI_Info_set, "libmpi"), C_int, (C_MPI_Info, MPIPtr, MPIPtr), info, key, value)
end

function MPI_Init(argc::ArgPtr{C_int}, argv::Ptr{Ptr{Ptr{C_char}}})::C_int
    return ccall((:MPI_Init, "libmpi"), C_int, (MPIPtr, MPIPtr), argc, argv)
end

function MPI_Init_thread(argc::ArgPtr{C_int}, argv::Ptr{Ptr{Ptr{C_char}}}, required::C_int, provided::ArgPtr{C_int})::C_int
    return ccall((:MPI_Init_thread, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, MPIPtr), argc, argv, required, provided)
end

function MPI_Initialized(flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Initialized, "libmpi"), C_int, (MPIPtr,), flag)
end

function MPI_Intercomm_create(local_comm::C_MPI_Comm, local_leader::C_int, bridge_comm::C_MPI_Comm, remote_leader::C_int, tag::C_int, newintercomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Intercomm_create, "libmpi"), C_int, (C_MPI_Comm, C_int, C_MPI_Comm, C_int, C_int, MPIPtr), local_comm, local_leader, bridge_comm, remote_leader, tag, newintercomm)
end

function MPI_Intercomm_merge(intercomm::C_MPI_Comm, high::C_int, newintercomm::ArgPtr{C_MPI_Comm})::C_int
    return ccall((:MPI_Intercomm_merge, "libmpi"), C_int, (C_MPI_Comm, C_int, MPIPtr), intercomm, high, newintercomm)
end

function MPI_Iprobe(source::C_int, tag::C_int, comm::C_MPI_Comm, flag::ArgPtr{C_int}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Iprobe, "libmpi"), C_int, (C_int, C_int, C_MPI_Comm, MPIPtr, MPIPtr), source, tag, comm, flag, status)
end

function MPI_Irecv(buf, count::C_int, datatype::C_MPI_Datatype, source::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Irecv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, source, tag, comm, request)
end

function MPI_Ireduce(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ireduce, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_int, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, count, datatype, op, root, comm, request)
end

function MPI_Ireduce_scatter(sendbuf, recvbuf, recvcounts::ArgPtr{C_int}, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ireduce_scatter, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, recvcounts, datatype, op, comm, request)
end

function MPI_Ireduce_scatter_block(sendbuf, recvbuf, recvcount::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ireduce_scatter_block, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, recvcount, datatype, op, comm, request)
end

function MPI_Irsend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Irsend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Is_thread_main(flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Is_thread_main, "libmpi"), C_int, (MPIPtr,), flag)
end

function MPI_Iscan(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iscan, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm, MPIPtr), sendbuf, recvbuf, count, datatype, op, comm, request)
end

function MPI_Iscatter(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iscatter, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, request)
end

function MPI_Iscatterv(sendbuf, sendcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Iscatterv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm, MPIPtr), sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm, request)
end

function MPI_Isend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Isend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Issend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Issend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Keyval_create(copy_fn::Ptr{Cvoid}, delete_fn::Ptr{Cvoid}, keyval::ArgPtr{C_int}, MPI2)::C_int
    return ccall((:MPI_Keyval_create, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr), copy_fn, delete_fn, keyval, MPI2)
end

function MPI_Keyval_free(MPI2::ArgPtr{C_int})::C_int
    return ccall((:MPI_Keyval_free, "libmpi"), C_int, (MPIPtr,), MPI2)
end

function MPI_Lookup_name(service_name::ArgPtr{C_char}, info::C_MPI_Info, port_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Lookup_name, "libmpi"), C_int, (MPIPtr, C_MPI_Info, MPIPtr), service_name, info, port_name)
end

function MPI_Mprobe(source::C_int, tag::C_int, comm::C_MPI_Comm, message::ArgPtr{C_MPI_Message}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Mprobe, "libmpi"), C_int, (C_int, C_int, C_MPI_Comm, MPIPtr, MPIPtr), source, tag, comm, message, status)
end

function MPI_Mrecv(buf, count::C_int, type::C_MPI_Datatype, message::ArgPtr{C_MPI_Message}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Mrecv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr), buf, count, type, message, status)
end

function MPI_Neighbor_allgather(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Neighbor_allgather, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm)
end

function MPI_Neighbor_allgatherv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Neighbor_allgatherv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm)
end

function MPI_Neighbor_alltoall(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Neighbor_alltoall, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm)
end

function MPI_Neighbor_alltoallv(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_int}, recvtype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Neighbor_alltoallv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Comm), sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm)
end

function MPI_Neighbor_alltoallw(sendbuf, sendcounts::ArgPtr{C_int}, sdispls::ArgPtr{C_MPI_Aint}, sendtypes::ArgPtr{C_MPI_Datatype}, recvbuf, recvcounts::ArgPtr{C_int}, rdispls::ArgPtr{C_MPI_Aint}, recvtypes::ArgPtr{C_MPI_Datatype}, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Neighbor_alltoallw, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_MPI_Comm), sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm)
end

function MPI_Op_commutative(op::C_MPI_Op, commute::ArgPtr{C_int})::C_int
    return ccall((:MPI_Op_commutative, "libmpi"), C_int, (C_MPI_Op, MPIPtr), op, commute)
end

function MPI_Op_create(_function::Ptr{Cvoid}, commute::C_int, op::ArgPtr{C_MPI_Op})::C_int
    return ccall((:MPI_Op_create, "libmpi"), C_int, (MPIPtr, C_int, MPIPtr), _function, commute, op)
end

function MPI_Op_free(op::ArgPtr{C_MPI_Op})::C_int
    return ccall((:MPI_Op_free, "libmpi"), C_int, (MPIPtr,), op)
end

function MPI_Open_port(info::C_MPI_Info, port_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Open_port, "libmpi"), C_int, (C_MPI_Info, MPIPtr), info, port_name)
end

function MPI_Pack(inbuf, incount::C_int, datatype::C_MPI_Datatype, outbuf, outsize::C_int, position::ArgPtr{C_int}, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Pack, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, MPIPtr, C_MPI_Comm), inbuf, incount, datatype, outbuf, outsize, position, comm)
end

function MPI_Pack_external(datarep::ArgPtr{C_char}, inbuf, incount::C_int, datatype::C_MPI_Datatype, outbuf, outsize::C_MPI_Aint, position::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_Pack_external, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_MPI_Aint, MPIPtr), datarep, inbuf, incount, datatype, outbuf, outsize, position)
end

function MPI_Pack_external_size(datarep::ArgPtr{C_char}, incount::C_int, datatype::C_MPI_Datatype, size::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_Pack_external_size, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr), datarep, incount, datatype, size)
end

function MPI_Pack_size(incount::C_int, datatype::C_MPI_Datatype, comm::C_MPI_Comm, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Pack_size, "libmpi"), C_int, (C_int, C_MPI_Datatype, C_MPI_Comm, MPIPtr), incount, datatype, comm, size)
end

function JL_MPI_Pcontrol(level::C_int)::C_int
    return ccall((:JL_MPI_Pcontrol, "libmpi"), C_int, (C_int,), level)
end

function MPI_Probe(source::C_int, tag::C_int, comm::C_MPI_Comm, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Probe, "libmpi"), C_int, (C_int, C_int, C_MPI_Comm, MPIPtr), source, tag, comm, status)
end

function MPI_Publish_name(service_name::ArgPtr{C_char}, info::C_MPI_Info, port_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Publish_name, "libmpi"), C_int, (MPIPtr, C_MPI_Info, MPIPtr), service_name, info, port_name)
end

function MPI_Put(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, win::C_MPI_Win)::C_int
    return ccall((:MPI_Put, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Win), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, win)
end

function MPI_Query_thread(provided::ArgPtr{C_int})::C_int
    return ccall((:MPI_Query_thread, "libmpi"), C_int, (MPIPtr,), provided)
end

function MPI_Raccumulate(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, op::C_MPI_Op, win::C_MPI_Win, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Raccumulate, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Win, MPIPtr), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request)
end

function MPI_Recv(buf, count::C_int, datatype::C_MPI_Datatype, source::C_int, tag::C_int, comm::C_MPI_Comm, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Recv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, source, tag, comm, status)
end

function MPI_Recv_init(buf, count::C_int, datatype::C_MPI_Datatype, source::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Recv_init, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, source, tag, comm, request)
end

function MPI_Reduce(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Reduce, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_int, C_MPI_Comm), sendbuf, recvbuf, count, datatype, op, root, comm)
end

function MPI_Reduce_local(inbuf, inoutbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op)::C_int
    return ccall((:MPI_Reduce_local, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op), inbuf, inoutbuf, count, datatype, op)
end

function MPI_Reduce_scatter(sendbuf, recvbuf, recvcounts::ArgPtr{C_int}, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Reduce_scatter, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm), sendbuf, recvbuf, recvcounts, datatype, op, comm)
end

function MPI_Reduce_scatter_block(sendbuf, recvbuf, recvcount::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Reduce_scatter_block, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm), sendbuf, recvbuf, recvcount, datatype, op, comm)
end

function MPI_Register_datarep(datarep::ArgPtr{C_char}, read_conversion_fn::Ptr{Cvoid}, write_conversion_fn::Ptr{Cvoid}, dtype_file_extent_fn::Ptr{Cvoid}, extra_state)::C_int
    return ccall((:MPI_Register_datarep, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr), datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state)
end

function MPI_Request_free(request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Request_free, "libmpi"), C_int, (MPIPtr,), request)
end

function MPI_Request_get_status(request::C_MPI_Request, flag::ArgPtr{C_int}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Request_get_status, "libmpi"), C_int, (C_MPI_Request, MPIPtr, MPIPtr), request, flag, status)
end

function MPI_Rget(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, win::C_MPI_Win, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Rget, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Win, MPIPtr), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, win, request)
end

function MPI_Rget_accumulate(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, result_addr, result_count::C_int, result_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_count::C_int, target_datatype::C_MPI_Datatype, op::C_MPI_Op, win::C_MPI_Win, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Rget_accumulate, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Win, MPIPtr), origin_addr, origin_count, origin_datatype, result_addr, result_count, result_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request)
end

function MPI_Rput(origin_addr, origin_count::C_int, origin_datatype::C_MPI_Datatype, target_rank::C_int, target_disp::C_MPI_Aint, target_cout::C_int, target_datatype::C_MPI_Datatype, win::C_MPI_Win, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Rput, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Aint, C_int, C_MPI_Datatype, C_MPI_Win, MPIPtr), origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_cout, target_datatype, win, request)
end

function MPI_Rsend(ibuf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Rsend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm), ibuf, count, datatype, dest, tag, comm)
end

function MPI_Rsend_init(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Rsend_init, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Scan(sendbuf, recvbuf, count::C_int, datatype::C_MPI_Datatype, op::C_MPI_Op, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Scan, "libmpi"), C_int, (MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Op, C_MPI_Comm), sendbuf, recvbuf, count, datatype, op, comm)
end

function MPI_Scatter(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Scatter, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm), sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm)
end

function MPI_Scatterv(sendbuf, sendcounts::ArgPtr{C_int}, displs::ArgPtr{C_int}, sendtype::C_MPI_Datatype, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, root::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Scatterv, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr, C_int, C_MPI_Datatype, C_int, C_MPI_Comm), sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm)
end

function MPI_Send(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Send, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm), buf, count, datatype, dest, tag, comm)
end

function MPI_Send_init(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Send_init, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Sendrecv(sendbuf, sendcount::C_int, sendtype::C_MPI_Datatype, dest::C_int, sendtag::C_int, recvbuf, recvcount::C_int, recvtype::C_MPI_Datatype, source::C_int, recvtag::C_int, comm::C_MPI_Comm, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Sendrecv, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), sendbuf, sendcount, sendtype, dest, sendtag, recvbuf, recvcount, recvtype, source, recvtag, comm, status)
end

function MPI_Sendrecv_replace(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, sendtag::C_int, source::C_int, recvtag::C_int, comm::C_MPI_Comm, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Sendrecv_replace, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, sendtag, source, recvtag, comm, status)
end

function MPI_Ssend(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Ssend, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm), buf, count, datatype, dest, tag, comm)
end

function MPI_Ssend_init(buf, count::C_int, datatype::C_MPI_Datatype, dest::C_int, tag::C_int, comm::C_MPI_Comm, request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Ssend_init, "libmpi"), C_int, (MPIPtr, C_int, C_MPI_Datatype, C_int, C_int, C_MPI_Comm, MPIPtr), buf, count, datatype, dest, tag, comm, request)
end

function MPI_Start(request::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Start, "libmpi"), C_int, (MPIPtr,), request)
end

function MPI_Startall(count::C_int, array_of_requests::ArgPtr{C_MPI_Request})::C_int
    return ccall((:MPI_Startall, "libmpi"), C_int, (C_int, MPIPtr), count, array_of_requests)
end

function MPI_Status_set_cancelled(status::ArgPtr{C_MPI_Status}, flag::C_int)::C_int
    return ccall((:MPI_Status_set_cancelled, "libmpi"), C_int, (MPIPtr, C_int), status, flag)
end

function MPI_Status_set_elements(status::ArgPtr{C_MPI_Status}, datatype::C_MPI_Datatype, count::C_int)::C_int
    return ccall((:MPI_Status_set_elements, "libmpi"), C_int, (MPIPtr, C_MPI_Datatype, C_int), status, datatype, count)
end

function MPI_Status_set_elements_x(status::ArgPtr{C_MPI_Status}, datatype::C_MPI_Datatype, count::C_MPI_Count)::C_int
    return ccall((:MPI_Status_set_elements_x, "libmpi"), C_int, (MPIPtr, C_MPI_Datatype, C_MPI_Count), status, datatype, count)
end

function MPI_T_category_changed(stamp::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_changed, "libmpi"), C_int, (MPIPtr,), stamp)
end

function MPI_T_category_get_categories(cat_index::C_int, len::C_int, indices::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_categories, "libmpi"), C_int, (C_int, C_int, MPIPtr), cat_index, len, indices)
end

function MPI_T_category_get_cvars(cat_index::C_int, len::C_int, indices::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_cvars, "libmpi"), C_int, (C_int, C_int, MPIPtr), cat_index, len, indices)
end

function MPI_T_category_get_index(x0::ArgPtr{C_char}, x1::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_index, "libmpi"), C_int, (MPIPtr, MPIPtr), x0, x1)
end

function MPI_T_category_get_info(cat_index::C_int, name::ArgPtr{C_char}, name_len::ArgPtr{C_int}, desc::ArgPtr{C_char}, desc_len::ArgPtr{C_int}, num_cvars::ArgPtr{C_int}, num_pvars::ArgPtr{C_int}, num_categories::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_info, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr), cat_index, name, name_len, desc, desc_len, num_cvars, num_pvars, num_categories)
end

function MPI_T_category_get_num(num_cat::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_num, "libmpi"), C_int, (MPIPtr,), num_cat)
end

function MPI_T_category_get_pvars(cat_index::C_int, len::C_int, indices::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_category_get_pvars, "libmpi"), C_int, (C_int, C_int, MPIPtr), cat_index, len, indices)
end

function MPI_T_cvar_get_index(x0::ArgPtr{C_char}, x1::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_cvar_get_index, "libmpi"), C_int, (MPIPtr, MPIPtr), x0, x1)
end

function MPI_T_cvar_get_info(x0::C_int, x1::ArgPtr{C_char}, x2::ArgPtr{C_int}, x3::ArgPtr{C_int}, x4::ArgPtr{C_MPI_Datatype}, x5::ArgPtr{C_MPI_T_enum}, x6::ArgPtr{C_char}, x7::ArgPtr{C_int}, x8::ArgPtr{C_int}, x9::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_cvar_get_info, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr), x0, x1, x2, x3, x4, x5, x6, x7, x8, x9)
end

function MPI_T_cvar_get_num(x0::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_cvar_get_num, "libmpi"), C_int, (MPIPtr,), x0)
end

function MPI_T_cvar_handle_alloc(x0::C_int, x1, x2::ArgPtr{C_MPI_T_cvar_handle}, x3::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_cvar_handle_alloc, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr), x0, x1, x2, x3)
end

function MPI_T_cvar_handle_free(x0::ArgPtr{C_MPI_T_cvar_handle})::C_int
    return ccall((:MPI_T_cvar_handle_free, "libmpi"), C_int, (MPIPtr,), x0)
end

function MPI_T_cvar_read(x0::C_MPI_T_cvar_handle, x1)::C_int
    return ccall((:MPI_T_cvar_read, "libmpi"), C_int, (C_MPI_T_cvar_handle, MPIPtr), x0, x1)
end

function MPI_T_cvar_write(x0::C_MPI_T_cvar_handle, x1)::C_int
    return ccall((:MPI_T_cvar_write, "libmpi"), C_int, (C_MPI_T_cvar_handle, MPIPtr), x0, x1)
end

function MPI_T_enum_get_info(enumtype::C_MPI_T_enum, num::ArgPtr{C_int}, name::ArgPtr{C_char}, name_len::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_enum_get_info, "libmpi"), C_int, (C_MPI_T_enum, MPIPtr, MPIPtr, MPIPtr), enumtype, num, name, name_len)
end

function MPI_T_enum_get_item(enumtype::C_MPI_T_enum, index::C_int, value::ArgPtr{C_int}, name::ArgPtr{C_char}, name_len::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_enum_get_item, "libmpi"), C_int, (C_MPI_T_enum, C_int, MPIPtr, MPIPtr, MPIPtr), enumtype, index, value, name, name_len)
end

function MPI_T_finalize()::C_int
    return ccall((:MPI_T_finalize, "libmpi"), C_int, (), )
end

function MPI_T_init_thread(x0::C_int, x1::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_init_thread, "libmpi"), C_int, (C_int, MPIPtr), x0, x1)
end

function MPI_T_pvar_get_index(x0::ArgPtr{C_char}, x1::C_int, x2::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_pvar_get_index, "libmpi"), C_int, (MPIPtr, C_int, MPIPtr), x0, x1, x2)
end

function MPI_T_pvar_get_info(pvar_index::C_int, name::ArgPtr{C_char}, name_len::ArgPtr{C_int}, verbosity::ArgPtr{C_int}, var_class::ArgPtr{C_int}, datatype::ArgPtr{C_MPI_Datatype}, enumtype::ArgPtr{C_MPI_T_enum}, desc::ArgPtr{C_char}, desc_len::ArgPtr{C_int}, bind::ArgPtr{C_int}, readonly::ArgPtr{C_int}, continuous::ArgPtr{C_int}, atomic::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_pvar_get_info, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr, MPIPtr), pvar_index, name, name_len, verbosity, var_class, datatype, enumtype, desc, desc_len, bind, readonly, continuous, atomic)
end

function MPI_T_pvar_get_num(num_pvar::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_pvar_get_num, "libmpi"), C_int, (MPIPtr,), num_pvar)
end

function MPI_T_pvar_handle_alloc(session::C_MPI_T_pvar_session, pvar_index::C_int, obj_handle, handle::ArgPtr{C_MPI_T_pvar_handle}, count::ArgPtr{C_int})::C_int
    return ccall((:MPI_T_pvar_handle_alloc, "libmpi"), C_int, (C_MPI_T_pvar_session, C_int, MPIPtr, MPIPtr, MPIPtr), session, pvar_index, obj_handle, handle, count)
end

function MPI_T_pvar_handle_free(session::C_MPI_T_pvar_session, handle::ArgPtr{C_MPI_T_pvar_handle})::C_int
    return ccall((:MPI_T_pvar_handle_free, "libmpi"), C_int, (C_MPI_T_pvar_session, MPIPtr), session, handle)
end

function MPI_T_pvar_read(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle, buf)::C_int
    return ccall((:MPI_T_pvar_read, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle, MPIPtr), session, handle, buf)
end

function MPI_T_pvar_readreset(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle, buf)::C_int
    return ccall((:MPI_T_pvar_readreset, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle, MPIPtr), session, handle, buf)
end

function MPI_T_pvar_reset(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle)::C_int
    return ccall((:MPI_T_pvar_reset, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle), session, handle)
end

function MPI_T_pvar_session_create(session::ArgPtr{C_MPI_T_pvar_session})::C_int
    return ccall((:MPI_T_pvar_session_create, "libmpi"), C_int, (MPIPtr,), session)
end

function MPI_T_pvar_session_free(session::ArgPtr{C_MPI_T_pvar_session})::C_int
    return ccall((:MPI_T_pvar_session_free, "libmpi"), C_int, (MPIPtr,), session)
end

function MPI_T_pvar_start(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle)::C_int
    return ccall((:MPI_T_pvar_start, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle), session, handle)
end

function MPI_T_pvar_stop(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle)::C_int
    return ccall((:MPI_T_pvar_stop, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle), session, handle)
end

function MPI_T_pvar_write(session::C_MPI_T_pvar_session, handle::C_MPI_T_pvar_handle, buf)::C_int
    return ccall((:MPI_T_pvar_write, "libmpi"), C_int, (C_MPI_T_pvar_session, C_MPI_T_pvar_handle, MPIPtr), session, handle, buf)
end

function MPI_Test(request::ArgPtr{C_MPI_Request}, flag::ArgPtr{C_int}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Test, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr), request, flag, status)
end

function MPI_Test_cancelled(status::ArgPtr{C_MPI_Status}, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Test_cancelled, "libmpi"), C_int, (MPIPtr, MPIPtr), status, flag)
end

function MPI_Testall(count::C_int, array_of_requests::ArgPtr{C_MPI_Request}, flag::ArgPtr{C_int}, array_of_statuses::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Testall, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr), count, array_of_requests, flag, array_of_statuses)
end

function MPI_Testany(count::C_int, array_of_requests::ArgPtr{C_MPI_Request}, index::ArgPtr{C_int}, flag::ArgPtr{C_int}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Testany, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr), count, array_of_requests, index, flag, status)
end

function MPI_Testsome(incount::C_int, array_of_requests::ArgPtr{C_MPI_Request}, outcount::ArgPtr{C_int}, array_of_indices::ArgPtr{C_int}, array_of_statuses::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Testsome, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr), incount, array_of_requests, outcount, array_of_indices, array_of_statuses)
end

function MPI_Topo_test(comm::C_MPI_Comm, status::ArgPtr{C_int})::C_int
    return ccall((:MPI_Topo_test, "libmpi"), C_int, (C_MPI_Comm, MPIPtr), comm, status)
end

function MPI_Type_commit(type::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_commit, "libmpi"), C_int, (MPIPtr,), type)
end

function MPI_Type_contiguous(count::C_int, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_contiguous, "libmpi"), C_int, (C_int, C_MPI_Datatype, MPIPtr), count, oldtype, newtype)
end

function MPI_Type_create_darray(size::C_int, rank::C_int, ndims::C_int, gsize_array::ArgPtr{C_int}, distrib_array::ArgPtr{C_int}, darg_array::ArgPtr{C_int}, psize_array::ArgPtr{C_int}, order::C_int, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_darray, "libmpi"), C_int, (C_int, C_int, C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), size, rank, ndims, gsize_array, distrib_array, darg_array, psize_array, order, oldtype, newtype)
end

function MPI_Type_create_f90_complex(p::C_int, r::C_int, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_f90_complex, "libmpi"), C_int, (C_int, C_int, MPIPtr), p, r, newtype)
end

function MPI_Type_create_f90_integer(r::C_int, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_f90_integer, "libmpi"), C_int, (C_int, MPIPtr), r, newtype)
end

function MPI_Type_create_f90_real(p::C_int, r::C_int, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_f90_real, "libmpi"), C_int, (C_int, C_int, MPIPtr), p, r, newtype)
end

function MPI_Type_create_hindexed(count::C_int, array_of_blocklengths::ArgPtr{C_int}, array_of_displacements::ArgPtr{C_MPI_Aint}, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_hindexed, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr), count, array_of_blocklengths, array_of_displacements, oldtype, newtype)
end

function MPI_Type_create_hindexed_block(count::C_int, blocklength::C_int, array_of_displacements::ArgPtr{C_MPI_Aint}, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_hindexed_block, "libmpi"), C_int, (C_int, C_int, MPIPtr, C_MPI_Datatype, MPIPtr), count, blocklength, array_of_displacements, oldtype, newtype)
end

function MPI_Type_create_hvector(count::C_int, blocklength::C_int, stride::C_MPI_Aint, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_hvector, "libmpi"), C_int, (C_int, C_int, C_MPI_Aint, C_MPI_Datatype, MPIPtr), count, blocklength, stride, oldtype, newtype)
end

function MPI_Type_create_indexed_block(count::C_int, blocklength::C_int, array_of_displacements::ArgPtr{C_int}, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_indexed_block, "libmpi"), C_int, (C_int, C_int, MPIPtr, C_MPI_Datatype, MPIPtr), count, blocklength, array_of_displacements, oldtype, newtype)
end

function MPI_Type_create_keyval(type_copy_attr_fn::Ptr{Cvoid}, type_delete_attr_fn::Ptr{Cvoid}, type_keyval::ArgPtr{C_int}, extra_state)::C_int
    return ccall((:MPI_Type_create_keyval, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr), type_copy_attr_fn, type_delete_attr_fn, type_keyval, extra_state)
end

function MPI_Type_create_resized(oldtype::C_MPI_Datatype, lb::C_MPI_Aint, extent::C_MPI_Aint, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_resized, "libmpi"), C_int, (C_MPI_Datatype, C_MPI_Aint, C_MPI_Aint, MPIPtr), oldtype, lb, extent, newtype)
end

function MPI_Type_create_struct(count::C_int, array_of_block_lengths::ArgPtr{C_int}, array_of_displacements::ArgPtr{C_MPI_Aint}, array_of_types::ArgPtr{C_MPI_Datatype}, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_struct, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr), count, array_of_block_lengths, array_of_displacements, array_of_types, newtype)
end

function MPI_Type_create_subarray(ndims::C_int, size_array::ArgPtr{C_int}, subsize_array::ArgPtr{C_int}, start_array::ArgPtr{C_int}, order::C_int, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_create_subarray, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, C_int, C_MPI_Datatype, MPIPtr), ndims, size_array, subsize_array, start_array, order, oldtype, newtype)
end

function MPI_Type_delete_attr(type::C_MPI_Datatype, type_keyval::C_int)::C_int
    return ccall((:MPI_Type_delete_attr, "libmpi"), C_int, (C_MPI_Datatype, C_int), type, type_keyval)
end

function MPI_Type_dup(type::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_dup, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr), type, newtype)
end

function MPI_Type_free(type::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_free, "libmpi"), C_int, (MPIPtr,), type)
end

function MPI_Type_free_keyval(type_keyval::ArgPtr{C_int})::C_int
    return ccall((:MPI_Type_free_keyval, "libmpi"), C_int, (MPIPtr,), type_keyval)
end

function MPI_Type_get_attr(type::C_MPI_Datatype, type_keyval::C_int, attribute_val, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Type_get_attr, "libmpi"), C_int, (C_MPI_Datatype, C_int, MPIPtr, MPIPtr), type, type_keyval, attribute_val, flag)
end

function MPI_Type_get_contents(mtype::C_MPI_Datatype, max_integers::C_int, max_addresses::C_int, max_datatypes::C_int, array_of_integers::ArgPtr{C_int}, array_of_addresses::ArgPtr{C_MPI_Aint}, array_of_datatypes::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_get_contents, "libmpi"), C_int, (C_MPI_Datatype, C_int, C_int, C_int, MPIPtr, MPIPtr, MPIPtr), mtype, max_integers, max_addresses, max_datatypes, array_of_integers, array_of_addresses, array_of_datatypes)
end

function MPI_Type_get_envelope(type::C_MPI_Datatype, num_integers::ArgPtr{C_int}, num_addresses::ArgPtr{C_int}, num_datatypes::ArgPtr{C_int}, combiner::ArgPtr{C_int})::C_int
    return ccall((:MPI_Type_get_envelope, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr, MPIPtr, MPIPtr), type, num_integers, num_addresses, num_datatypes, combiner)
end

function MPI_Type_get_extent(type::C_MPI_Datatype, lb::ArgPtr{C_MPI_Aint}, extent::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_Type_get_extent, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr), type, lb, extent)
end

function MPI_Type_get_extent_x(type::C_MPI_Datatype, lb::ArgPtr{C_MPI_Count}, extent::ArgPtr{C_MPI_Count})::C_int
    return ccall((:MPI_Type_get_extent_x, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr), type, lb, extent)
end

function MPI_Type_get_name(type::C_MPI_Datatype, type_name::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Type_get_name, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr), type, type_name, resultlen)
end

function MPI_Type_get_true_extent(datatype::C_MPI_Datatype, true_lb::ArgPtr{C_MPI_Aint}, true_extent::ArgPtr{C_MPI_Aint})::C_int
    return ccall((:MPI_Type_get_true_extent, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr), datatype, true_lb, true_extent)
end

function MPI_Type_get_true_extent_x(datatype::C_MPI_Datatype, true_lb::ArgPtr{C_MPI_Count}, true_extent::ArgPtr{C_MPI_Count})::C_int
    return ccall((:MPI_Type_get_true_extent_x, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr, MPIPtr), datatype, true_lb, true_extent)
end

function MPI_Type_indexed(count::C_int, array_of_blocklengths::ArgPtr{C_int}, array_of_displacements::ArgPtr{C_int}, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_indexed, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, C_MPI_Datatype, MPIPtr), count, array_of_blocklengths, array_of_displacements, oldtype, newtype)
end

function MPI_Type_match_size(typeclass::C_int, size::C_int, type::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_match_size, "libmpi"), C_int, (C_int, C_int, MPIPtr), typeclass, size, type)
end

function MPI_Type_set_attr(type::C_MPI_Datatype, type_keyval::C_int, attr_val)::C_int
    return ccall((:MPI_Type_set_attr, "libmpi"), C_int, (C_MPI_Datatype, C_int, MPIPtr), type, type_keyval, attr_val)
end

function MPI_Type_set_name(type::C_MPI_Datatype, type_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Type_set_name, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr), type, type_name)
end

function MPI_Type_size(type::C_MPI_Datatype, size::ArgPtr{C_int})::C_int
    return ccall((:MPI_Type_size, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr), type, size)
end

function MPI_Type_size_x(type::C_MPI_Datatype, size::ArgPtr{C_MPI_Count})::C_int
    return ccall((:MPI_Type_size_x, "libmpi"), C_int, (C_MPI_Datatype, MPIPtr), type, size)
end

function MPI_Type_vector(count::C_int, blocklength::C_int, stride::C_int, oldtype::C_MPI_Datatype, newtype::ArgPtr{C_MPI_Datatype})::C_int
    return ccall((:MPI_Type_vector, "libmpi"), C_int, (C_int, C_int, C_int, C_MPI_Datatype, MPIPtr), count, blocklength, stride, oldtype, newtype)
end

function MPI_Unpack(inbuf, insize::C_int, position::ArgPtr{C_int}, outbuf, outcount::C_int, datatype::C_MPI_Datatype, comm::C_MPI_Comm)::C_int
    return ccall((:MPI_Unpack, "libmpi"), C_int, (MPIPtr, C_int, MPIPtr, MPIPtr, C_int, C_MPI_Datatype, C_MPI_Comm), inbuf, insize, position, outbuf, outcount, datatype, comm)
end

function MPI_Unpack_external(x0::ArgPtr{C_char}, x1, x2::C_MPI_Aint, x3::ArgPtr{C_MPI_Aint}, x4, x5::C_int, x6::C_MPI_Datatype)::C_int
    return ccall((:MPI_Unpack_external, "libmpi"), C_int, (MPIPtr, MPIPtr, C_MPI_Aint, MPIPtr, MPIPtr, C_int, C_MPI_Datatype), x0, x1, x2, x3, x4, x5, x6)
end

function MPI_Unpublish_name(service_name::ArgPtr{C_char}, info::C_MPI_Info, port_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Unpublish_name, "libmpi"), C_int, (MPIPtr, C_MPI_Info, MPIPtr), service_name, info, port_name)
end

function MPI_Wait(request::ArgPtr{C_MPI_Request}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Wait, "libmpi"), C_int, (MPIPtr, MPIPtr), request, status)
end

function MPI_Waitall(count::C_int, array_of_requests::ArgPtr{C_MPI_Request}, array_of_statuses::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Waitall, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr), count, array_of_requests, array_of_statuses)
end

function MPI_Waitany(count::C_int, array_of_requests::ArgPtr{C_MPI_Request}, index::ArgPtr{C_int}, status::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Waitany, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr), count, array_of_requests, index, status)
end

function MPI_Waitsome(incount::C_int, array_of_requests::ArgPtr{C_MPI_Request}, outcount::ArgPtr{C_int}, array_of_indices::ArgPtr{C_int}, array_of_statuses::ArgPtr{C_MPI_Status})::C_int
    return ccall((:MPI_Waitsome, "libmpi"), C_int, (C_int, MPIPtr, MPIPtr, MPIPtr, MPIPtr), incount, array_of_requests, outcount, array_of_indices, array_of_statuses)
end

function MPI_Win_allocate(size::C_MPI_Aint, disp_unit::C_int, info::C_MPI_Info, comm::C_MPI_Comm, baseptr, win::ArgPtr{C_MPI_Win})::C_int
    return ccall((:MPI_Win_allocate, "libmpi"), C_int, (C_MPI_Aint, C_int, C_MPI_Info, C_MPI_Comm, MPIPtr, MPIPtr), size, disp_unit, info, comm, baseptr, win)
end

function MPI_Win_allocate_shared(size::C_MPI_Aint, disp_unit::C_int, info::C_MPI_Info, comm::C_MPI_Comm, baseptr, win::ArgPtr{C_MPI_Win})::C_int
    return ccall((:MPI_Win_allocate_shared, "libmpi"), C_int, (C_MPI_Aint, C_int, C_MPI_Info, C_MPI_Comm, MPIPtr, MPIPtr), size, disp_unit, info, comm, baseptr, win)
end

function MPI_Win_attach(win::C_MPI_Win, base, size::C_MPI_Aint)::C_int
    return ccall((:MPI_Win_attach, "libmpi"), C_int, (C_MPI_Win, MPIPtr, C_MPI_Aint), win, base, size)
end

function MPI_Win_call_errhandler(win::C_MPI_Win, errorcode::C_int)::C_int
    return ccall((:MPI_Win_call_errhandler, "libmpi"), C_int, (C_MPI_Win, C_int), win, errorcode)
end

function MPI_Win_complete(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_complete, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Win_create(base, size::C_MPI_Aint, disp_unit::C_int, info::C_MPI_Info, comm::C_MPI_Comm, win::ArgPtr{C_MPI_Win})::C_int
    return ccall((:MPI_Win_create, "libmpi"), C_int, (MPIPtr, C_MPI_Aint, C_int, C_MPI_Info, C_MPI_Comm, MPIPtr), base, size, disp_unit, info, comm, win)
end

function MPI_Win_create_dynamic(info::C_MPI_Info, comm::C_MPI_Comm, win::ArgPtr{C_MPI_Win})::C_int
    return ccall((:MPI_Win_create_dynamic, "libmpi"), C_int, (C_MPI_Info, C_MPI_Comm, MPIPtr), info, comm, win)
end

function MPI_Win_create_errhandler(_function::Ptr{Cvoid}, errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_Win_create_errhandler, "libmpi"), C_int, (MPIPtr, MPIPtr), _function, errhandler)
end

function MPI_Win_create_keyval(win_copy_attr_fn::Ptr{Cvoid}, win_delete_attr_fn::Ptr{Cvoid}, win_keyval::ArgPtr{C_int}, extra_state)::C_int
    return ccall((:MPI_Win_create_keyval, "libmpi"), C_int, (MPIPtr, MPIPtr, MPIPtr, MPIPtr), win_copy_attr_fn, win_delete_attr_fn, win_keyval, extra_state)
end

function MPI_Win_delete_attr(win::C_MPI_Win, win_keyval::C_int)::C_int
    return ccall((:MPI_Win_delete_attr, "libmpi"), C_int, (C_MPI_Win, C_int), win, win_keyval)
end

function MPI_Win_detach(win::C_MPI_Win, base)::C_int
    return ccall((:MPI_Win_detach, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, base)
end

function MPI_Win_fence(assert::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_fence, "libmpi"), C_int, (C_int, C_MPI_Win), assert, win)
end

function MPI_Win_flush(rank::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_flush, "libmpi"), C_int, (C_int, C_MPI_Win), rank, win)
end

function MPI_Win_flush_all(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_flush_all, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Win_flush_local(rank::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_flush_local, "libmpi"), C_int, (C_int, C_MPI_Win), rank, win)
end

function MPI_Win_flush_local_all(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_flush_local_all, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Win_free(win::ArgPtr{C_MPI_Win})::C_int
    return ccall((:MPI_Win_free, "libmpi"), C_int, (MPIPtr,), win)
end

function MPI_Win_free_keyval(win_keyval::ArgPtr{C_int})::C_int
    return ccall((:MPI_Win_free_keyval, "libmpi"), C_int, (MPIPtr,), win_keyval)
end

function MPI_Win_get_attr(win::C_MPI_Win, win_keyval::C_int, attribute_val, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Win_get_attr, "libmpi"), C_int, (C_MPI_Win, C_int, MPIPtr, MPIPtr), win, win_keyval, attribute_val, flag)
end

function MPI_Win_get_errhandler(win::C_MPI_Win, errhandler::ArgPtr{C_MPI_Errhandler})::C_int
    return ccall((:MPI_Win_get_errhandler, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, errhandler)
end

function MPI_Win_get_group(win::C_MPI_Win, group::ArgPtr{C_MPI_Group})::C_int
    return ccall((:MPI_Win_get_group, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, group)
end

function MPI_Win_get_info(win::C_MPI_Win, info_used::ArgPtr{C_MPI_Info})::C_int
    return ccall((:MPI_Win_get_info, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, info_used)
end

function MPI_Win_get_name(win::C_MPI_Win, win_name::ArgPtr{C_char}, resultlen::ArgPtr{C_int})::C_int
    return ccall((:MPI_Win_get_name, "libmpi"), C_int, (C_MPI_Win, MPIPtr, MPIPtr), win, win_name, resultlen)
end

function MPI_Win_lock(lock_type::C_int, rank::C_int, assert::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_lock, "libmpi"), C_int, (C_int, C_int, C_int, C_MPI_Win), lock_type, rank, assert, win)
end

function MPI_Win_lock_all(assert::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_lock_all, "libmpi"), C_int, (C_int, C_MPI_Win), assert, win)
end

function MPI_Win_post(group::C_MPI_Group, assert::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_post, "libmpi"), C_int, (C_MPI_Group, C_int, C_MPI_Win), group, assert, win)
end

function MPI_Win_set_attr(win::C_MPI_Win, win_keyval::C_int, attribute_val)::C_int
    return ccall((:MPI_Win_set_attr, "libmpi"), C_int, (C_MPI_Win, C_int, MPIPtr), win, win_keyval, attribute_val)
end

function MPI_Win_set_errhandler(win::C_MPI_Win, errhandler::C_MPI_Errhandler)::C_int
    return ccall((:MPI_Win_set_errhandler, "libmpi"), C_int, (C_MPI_Win, C_MPI_Errhandler), win, errhandler)
end

function MPI_Win_set_info(win::C_MPI_Win, info::C_MPI_Info)::C_int
    return ccall((:MPI_Win_set_info, "libmpi"), C_int, (C_MPI_Win, C_MPI_Info), win, info)
end

function MPI_Win_set_name(win::C_MPI_Win, win_name::ArgPtr{C_char})::C_int
    return ccall((:MPI_Win_set_name, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, win_name)
end

function MPI_Win_shared_query(win::C_MPI_Win, rank::C_int, size::ArgPtr{C_MPI_Aint}, disp_unit::ArgPtr{C_int}, baseptr)::C_int
    return ccall((:MPI_Win_shared_query, "libmpi"), C_int, (C_MPI_Win, C_int, MPIPtr, MPIPtr, MPIPtr), win, rank, size, disp_unit, baseptr)
end

function MPI_Win_start(group::C_MPI_Group, assert::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_start, "libmpi"), C_int, (C_MPI_Group, C_int, C_MPI_Win), group, assert, win)
end

function MPI_Win_sync(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_sync, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Win_test(win::C_MPI_Win, flag::ArgPtr{C_int})::C_int
    return ccall((:MPI_Win_test, "libmpi"), C_int, (C_MPI_Win, MPIPtr), win, flag)
end

function MPI_Win_unlock(rank::C_int, win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_unlock, "libmpi"), C_int, (C_int, C_MPI_Win), rank, win)
end

function MPI_Win_unlock_all(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_unlock_all, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Win_wait(win::C_MPI_Win)::C_int
    return ccall((:MPI_Win_wait, "libmpi"), C_int, (C_MPI_Win,), win)
end

function MPI_Wtick()::C_double
    return ccall((:MPI_Wtick, "libmpi"), C_double, (), )
end

function MPI_Wtime()::C_double
    return ccall((:MPI_Wtime, "libmpi"), C_double, (), )
end

