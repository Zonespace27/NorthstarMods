
global function MpWeaponInstagib_Chargerifle_Init

global function OnWeaponPrimaryAttack_weapon_instagib_chargerifle
global function OnWeaponActivate_weapon_instagib_chargerifle

#if SERVER
global function OnWeaponNpcPrimaryAttack_weapon_instagib_chargerifle
#endif // #if SERVER

void function MpWeaponInstagib_Chargerifle_Init()
{
	Instagib_ChargeriflePrecache()
}

void function Instagib_ChargeriflePrecache()
{
	PrecacheParticleSystem($"P_wpn_defender_charge_FP")
		PrecacheParticleSystem($"P_wpn_defender_charge")
		PrecacheParticleSystem($"defender_charge_CH_dlight")

		PrecacheParticleSystem($"wpn_muzzleflash_arc_cannon_fp")
		PrecacheParticleSystem($"wpn_muzzleflash_arc_cannon")
}

var function OnWeaponPrimaryAttack_weapon_instagib_chargerifle(entity weapon, WeaponPrimaryAttackParams attackParams)
{
	return FireInstagib_Chargerifle(weapon, attackParams)
}


#if SERVER
var function OnWeaponNpcPrimaryAttack_weapon_instagib_chargerifle(entity weapon, WeaponPrimaryAttackParams attackParams)
{
	return FireInstagib_Chargerifle(weapon, attackParams)
}
#endif // #if SERVER

void function OnWeaponActivate_weapon_instagib_chargerifle(entity weapon)
{
	return
}

int function FireInstagib_Chargerifle(entity weapon, WeaponPrimaryAttackParams attackParams)
{
	weapon.EmitWeaponNpcSound(LOUD_WEAPON_AI_SOUND_RADIUS_MP, 0.2)
		weapon.FireWeaponBullet(attackParams.pos, attackParams.dir, 1, DF_GIB | DF_EXPLOSION)

		return 1
}
