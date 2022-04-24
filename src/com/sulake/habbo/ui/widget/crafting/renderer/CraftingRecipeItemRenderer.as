// by nota

//com.sulake.habbo.ui.widget.crafting.renderer.CraftingRecipeItemRenderer

package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;

    public class CraftingRecipeItemRenderer extends FurniThumbnailRendererBase 
    {

        public function CraftingRecipeItemRenderer(_arg_1:CraftingFurnitureItem, _arg_2:_SafeStr_3133, _arg_3:CraftingWidget)
        {
            super(_arg_1, _arg_2, _arg_3);
            hideItemCount();
        }

        override protected function onTriggered():void
        {
            if ((((!(_SafeStr_4981)) || (!(content))) || (_SafeStr_4981.craftingInProgress)))
            {
                return;
            };
            _SafeStr_4981.showCraftableProduct(content);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.renderer

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


