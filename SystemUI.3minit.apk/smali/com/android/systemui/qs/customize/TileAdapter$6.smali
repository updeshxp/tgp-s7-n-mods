.class Lcom/android/systemui/qs/customize/TileAdapter$6;
.super Ljava/lang/Object;
.source "TileAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/qs/customize/TileAdapter;->showAccessibilityDialog(ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/qs/customize/TileAdapter;

.field final synthetic val$position:I

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/systemui/qs/customize/TileAdapter;ILandroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->this$0:Lcom/android/systemui/qs/customize/TileAdapter;

    iput p2, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->val$position:I

    iput-object p3, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->this$0:Lcom/android/systemui/qs/customize/TileAdapter;

    iget v1, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->val$position:I

    invoke-static {v0, v1}, Lcom/android/systemui/qs/customize/TileAdapter;->-wrap3(Lcom/android/systemui/qs/customize/TileAdapter;I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->this$0:Lcom/android/systemui/qs/customize/TileAdapter;

    iget v1, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->val$position:I

    iget-object v2, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->this$0:Lcom/android/systemui/qs/customize/TileAdapter;

    invoke-static {v2}, Lcom/android/systemui/qs/customize/TileAdapter;->-get3(Lcom/android/systemui/qs/customize/TileAdapter;)I

    move-result v2

    iget-object v3, p0, Lcom/android/systemui/qs/customize/TileAdapter$6;->val$v:Landroid/view/View;

    invoke-static {v0, v1, v2, v3}, Lcom/android/systemui/qs/customize/TileAdapter;->-wrap0(Lcom/android/systemui/qs/customize/TileAdapter;IILandroid/view/View;)Z

    goto :goto_0
.end method
