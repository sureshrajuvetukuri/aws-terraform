module "vpc_modules" {

    source = "./Modules/aws_vpc"

    for_each = var.vpc_config
    
    vpc_cidr_block = each.value.vpc_cidr_block


    tags = each.value.tags


}

module "aws_subnet" {

    source = "./Modules/aws_subnet"

    for_each = var.subnet_config



    availability_zone = each.value.availability_zone

    subnet_cidr_block = each.value.cidr_block

    tags = each.value.tags

    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id





}

