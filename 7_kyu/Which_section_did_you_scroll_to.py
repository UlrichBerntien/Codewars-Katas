def get_section_id(scroll, sizes):
    for index,size in enumerate(sizes):
        scroll -= size
        if scroll < 0:
            return index
    return -1
