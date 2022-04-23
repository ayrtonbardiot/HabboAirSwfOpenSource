// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.crafting.controller.CraftingGridControllerBase

package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window._SafeStr_3133;

    public class CraftingGridControllerBase 
    {

        protected var _SafeStr_4981:CraftingWidget;

        public function CraftingGridControllerBase(_arg_1:CraftingWidget)
        {
            _SafeStr_4981 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
        }

        public function get mainWindow():_SafeStr_3133
        {
            return (_SafeStr_4981.window);
        }

        public function getItemTemplate():_SafeStr_3133
        {
            return (_SafeStr_4981.itemTemplate);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.controller

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


