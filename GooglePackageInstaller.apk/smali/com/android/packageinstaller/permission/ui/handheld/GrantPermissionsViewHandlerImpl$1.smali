.class Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;
.super Ljava/lang/Object;
.source "GrantPermissionsViewHandlerImpl.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->attachNewContent(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

.field final synthetic val$callback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    iput-object p2, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->val$callback:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 8

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get4(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewGroup;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get2(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    int-to-float v6, v0

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setTranslationX(F)V

    sub-int v5, p9, p7

    iget-object v6, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v6}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get0(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Lcom/android/packageinstaller/permission/ui/ButtonBarLayout;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/packageinstaller/permission/ui/ButtonBarLayout;->getHeight()I

    move-result v6

    sub-int v1, v5, v6

    int-to-float v5, v1

    iget-object v6, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v6}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v2, v5, v6

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v2

    iget-object v6, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v6}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    float-to-int v5, v5

    div-int/lit8 v3, v5, 0x2

    sub-int v5, p7, p3

    add-int v4, v5, v3

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->setScaleY(F)V

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    int-to-float v6, v4

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setTranslationY(F)V

    iget-object v5, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v5}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get3(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    iget-object v6, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->this$0:Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;

    invoke-static {v6}, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;->-get1(Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl;)Landroid/content/Context;

    move-result-object v6

    const v7, 0x10c000e

    invoke-static {v6, v7}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    const-wide/16 v6, 0x12c

    invoke-virtual {v5, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    iget-object v6, p0, Lcom/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl$1;->val$callback:Ljava/lang/Runnable;

    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method
