// by nota

//com.sulake.core.window.components.SelectorListController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.utils.PropertyStruct;

    public class SelectorListController extends SelectorController implements ISelectorListWindow 
    {

        protected var _SafeStr_5549:int = 0;
        private var _SafeStr_6428:Boolean = false;
        private var _SafeStr_5676:Boolean;

        public function SelectorListController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _SafeStr_5756 = false;
        }

        public function get spacing():int
        {
            return (_SafeStr_5549);
        }

        public function set spacing(_arg_1:int):void
        {
            _SafeStr_5549 = _arg_1;
            updateSelectableRegion();
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            if (_arg_2.type == "WE_CHILD_ADDED")
            {
                updateSelectableRegion();
            }
            else
            {
                if (_arg_2.type == "WE_CHILD_RESIZED")
                {
                    updateSelectableRegion();
                }
                else
                {
                    if (_arg_2.type == "WE_CHILD_RELOCATED")
                    {
                        updateSelectableRegion();
                    };
                };
            };
            return (super.update(_arg_1, _arg_2));
        }

        private function updateSelectableRegion():void
        {
            var _local_4:* = null;
            var _local_3:uint;
            if (_SafeStr_6428)
            {
                return;
            };
            _SafeStr_6428 = true;
            var _local_2:uint = numSelectables;
            var _local_1:int;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = getSelectableAt(_local_3);
                if (_SafeStr_5676)
                {
                    _local_4.y = _local_1;
                    _local_1 = (_local_1 + (_local_4.height + _SafeStr_5549));
                }
                else
                {
                    _local_4.x = _local_1;
                    _local_1 = (_local_1 + (_local_4.width + _SafeStr_5549));
                };
                _local_3++;
            };
            _SafeStr_6428 = false;
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.push(createProperty("spacing", _SafeStr_5549));
            _local_1.push(createProperty("vertical", _SafeStr_5676));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "spacing":
                        if (_local_2.value != _SafeStr_5549)
                        {
                            spacing = (_local_2.value as int);
                        };
                        break;
                    case "vertical":
                        if (_local_2.value != _SafeStr_5676)
                        {
                            vertical = (_local_2.value as Boolean);
                        };
                };
            };
            super.properties = _arg_1;
        }

        public function get vertical():Boolean
        {
            return (_SafeStr_5676);
        }

        public function set vertical(_arg_1:Boolean):void
        {
            _SafeStr_5676 = _arg_1;
            updateSelectableRegion();
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_5549 = "_-kU" (String#2439, DoABC#4)
// _SafeStr_5676 = "_-su" (String#2714, DoABC#4)
// _SafeStr_5756 = "_-XM" (String#19157, DoABC#4)
// _SafeStr_6428 = "_-y1d" (String#11014, DoABC#4)


