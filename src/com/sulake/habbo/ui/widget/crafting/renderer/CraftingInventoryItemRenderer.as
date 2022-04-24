// by nota

//com.sulake.habbo.ui.widget.crafting.renderer.CraftingInventoryItemRenderer

package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;

    public class CraftingInventoryItemRenderer extends FurniThumbnailRendererBase 
    {

        public function CraftingInventoryItemRenderer(_arg_1:CraftingFurnitureItem, _arg_2:_SafeStr_3133, _arg_3:CraftingWidget)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function onTriggered():void
        {
            if ((((!(_SafeStr_4981)) || (_SafeStr_4981.craftingInProgress)) || (_SafeStr_4981.inventoryDirty)))
            {
                return;
            };
            if (!_SafeStr_4981.mixerCtrl.canAdd())
            {
                return;
            };
            var _local_1:int = content.getItemToMixer();
            if (_local_1 == 0)
            {
                return;
            };
            _SafeStr_4981.showSecretRecipeView();
            _SafeStr_4981.mixerCtrl.addItemToMixer(content, _local_1);
            _SafeStr_4981.inventoryCtrl.updateItemCounts();
        }

        override public function updateItemCount():void
        {
            if (content)
            {
                updateGroupItemCount(content.countInInventory);
                updateBitmapBlend((content.countInInventory > 0));
            };
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.renderer

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


