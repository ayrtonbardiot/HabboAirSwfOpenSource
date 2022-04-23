// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem

package com.sulake.habbo.ui.widget.crafting.utils
{
    import flash.events.EventDispatcher;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import __AS3__.vec.Vector;

    public class CraftingFurnitureItem extends EventDispatcher 
    {

        private var _SafeStr_4838:String;
        private var _SafeStr_3867:_SafeStr_3130;
        private var _SafeStr_5796:Vector.<int>;
        private var _SafeStr_5797:Vector.<int>;

        public function CraftingFurnitureItem(_arg_1:String, _arg_2:_SafeStr_3130)
        {
            _SafeStr_4838 = _arg_1;
            _SafeStr_3867 = _arg_2;
            _SafeStr_5796 = new Vector.<int>(0);
            _SafeStr_5797 = new Vector.<int>(0);
        }

        public function get furnitureData():_SafeStr_3130
        {
            return (_SafeStr_3867);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get typeId():int
        {
            return ((_SafeStr_3867) ? _SafeStr_3867.id : -1);
        }

        public function get countInInventory():int
        {
            return ((_SafeStr_5796) ? _SafeStr_5796.length : 0);
        }

        public function set inventoryIds(_arg_1:Vector.<int>):void
        {
            _SafeStr_5796 = _arg_1;
        }

        public function getItemToMixer():int
        {
            if (countInInventory == 0)
            {
                return (0);
            };
            var _local_1:int = _SafeStr_5796.shift();
            _SafeStr_5797.push(_local_1);
            return (_local_1);
        }

        public function returnItemToInventory(_arg_1:int):void
        {
            _SafeStr_5796.push(_arg_1);
            _SafeStr_5797.splice(_SafeStr_5797.indexOf(_arg_1), 1);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.utils

// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)
// _SafeStr_4838 = "_-T1g" (String#4465, DoABC#4)
// _SafeStr_5796 = "_-L1e" (String#8543, DoABC#4)
// _SafeStr_5797 = "_-N1k" (String#12774, DoABC#4)


