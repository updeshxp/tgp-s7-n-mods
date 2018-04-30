.class public Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;
.super Landroid/support/wearable/view/WearableListView$ViewHolder;
.source "ExtendedViewHolder.java"


# instance fields
.field private mMaxValue:F

.field private mMinValue:F

.field private mScalingDownAnimator:Landroid/animation/ObjectAnimator;

.field private mScalingUpAnimator:Landroid/animation/ObjectAnimator;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 10

    const-wide/16 v8, 0x96

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-direct {p0, p1}, Landroid/support/wearable/view/WearableListView$ViewHolder;-><init>(Landroid/view/View;)V

    instance-of v1, p1, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;

    if-eqz v1, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getProximityMinValue()F

    move-result v1

    iput v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMinValue:F

    iget v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMinValue:F

    invoke-interface {v0, v1}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->setScalingAnimatorValue(F)V

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getProximityMaxValue()F

    move-result v1

    iput v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMaxValue:F

    const-string/jumbo v1, "scalingAnimatorValue"

    new-array v2, v6, [F

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMinValue:F

    aput v3, v2, v4

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMaxValue:F

    aput v3, v2, v5

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const-string/jumbo v1, "scalingAnimatorValue"

    new-array v2, v6, [F

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMaxValue:F

    aput v3, v2, v4

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMinValue:F

    aput v3, v2, v5

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    :cond_0
    return-void
.end method


# virtual methods
.method public onCenterProximity(ZZ)V
    .locals 6

    const/4 v2, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->itemView:Landroid/view/View;

    instance-of v1, v1, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;

    if-nez v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;

    if-eqz p1, :cond_3

    if-eqz p2, :cond_2

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    new-array v2, v2, [F

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getCurrentProximityValue()F

    move-result v3

    aput v3, v2, v4

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMaxValue:F

    aput v3, v2, v5

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/support/wearable/view/WearableListView$ViewHolder;->onCenterProximity(ZZ)V

    return-void

    :cond_2
    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getProximityMaxValue()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->setScalingAnimatorValue(F)V

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingUpAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    if-eqz p2, :cond_4

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    new-array v2, v2, [F

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getCurrentProximityValue()F

    move-result v3

    aput v3, v2, v4

    iget v3, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mMinValue:F

    aput v3, v2, v5

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedViewHolder;->mScalingDownAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    invoke-interface {v0}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->getProximityMinValue()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/packageinstaller/permission/ui/wear/settings/ExtendedOnCenterProximityListener;->setScalingAnimatorValue(F)V

    goto :goto_0
.end method
