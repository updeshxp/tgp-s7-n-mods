.class Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$1;
.super Ljava/lang/Object;
.source "ConfirmActionDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;


# direct methods
.method constructor <init>(Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$1;->this$0:Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v2, p0, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$1;->this$0:Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;

    invoke-virtual {v2}, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v2, v0, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$OnActionConfirmedListener;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$1;->this$0:Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;

    invoke-virtual {v2}, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "ACTION"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    check-cast v0, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$OnActionConfirmedListener;

    invoke-interface {v0, v1}, Lcom/android/packageinstaller/permission/ui/ConfirmActionDialogFragment$OnActionConfirmedListener;->onActionConfirmed(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
