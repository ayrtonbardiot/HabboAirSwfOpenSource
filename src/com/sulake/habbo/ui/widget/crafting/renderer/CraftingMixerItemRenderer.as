// by nota

//com.sulake.habbo.ui.widget.crafting.renderer.CraftingMixerItemRenderer

package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;

    public class CraftingMixerItemRenderer extends FurniThumbnailRendererBase 
    {

        private var _SafeStr_6639:int;

        public function CraftingMixerItemRenderer(_arg_1:CraftingFurnitureItem, _arg_2:_SafeStr_3133, _arg_3:CraftingWidget)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function onTriggered():void
        {
            if ((((!(_SafeStr_4981)) || (_SafeStr_4981.craftingInProgress)) || (_SafeStr_4981.inventoryDirty)))
            {
                return;
            };
            if (_SafeStr_6639 == 0)
            {
                _SafeStr_4981.setInfoState(9, furnitureData);
                return;
            };
            if (_SafeStr_4981.inSecretRecipeMode)
            {
                _SafeStr_4981.mixerCtrl.removeListItem(this);
            };
        }

        public function returnItemToInventory():void
        {
            if (_SafeStr_6639 != 0)
            {
                _SafeStr_3740.returnItemToInventory(_SafeStr_6639);
            };
            this.dispose();
        }

        override public function updateItemCount():void
        {
            updateBitmapBlend((!(_SafeStr_6639 == 0)));
        }

        public function get inventoryId():int
        {
            return (_SafeStr_6639);
        }

        public function set inventoryId(_arg_1:int):void
        {
            _SafeStr_6639 = _arg_1;
            updateItemCount();
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.renderer

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6639 = "_-8o" (String#9253, DoABC#4)


