/// @description

#region Reconcile
mNetworkX += hspeed;
mNetworkY += vspeed;

x = lerp(x, mNetworkX, 0.1);
y = lerp(y, mNetworkY, 0.1);
#endregion

#region Death
if (mIsAlive && mHitPoints <= 0) {
	mIsAlive = false;
	instance_create_layer(x, y, "Instances", oCorpse);
	visible = false;
}
#endregion
