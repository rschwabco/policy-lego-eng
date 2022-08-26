package lego.check_permission.__customer.__permission

default allowed = false

allowed {
	user = ds.object({
		"type": "user",
		"key": input.user.key,
	})

	customer = ds.object({
		"type": "customer",
		"key": input.resource.customer,
	})

	ds.check_permission({
		"sub_id": user.id,
		"type": "customer",
		"permission": input.resource.permission,
		"obj_id": customer.id,
	})
}
