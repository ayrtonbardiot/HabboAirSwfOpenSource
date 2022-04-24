// by nota

//com.sulake.core.window.components.ScrollBarLiftController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.WindowController;

    public class ScrollBarLiftController extends InteractiveController implements _SafeStr_3244 
    {

        protected var _SafeStr_5515:Number = 0;
        protected var _SafeStr_5516:Number = 0;
        protected var _scrollBar:ScrollBarController;

        public function ScrollBarLiftController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | 0x20);
            _arg_4 = (_arg_4 | 0x8000);
            _arg_4 = (_arg_4 | 0x0101);
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            var _local_12:* = _arg_7;
            while (_local_12 != null)
            {
                if ((_local_12 is IScrollbarWindow))
                {
                    _scrollBar = ScrollBarController(_local_12);
                    _local_12 = null;
                }
                else
                {
                    _local_12 = _local_12.parent;
                };
            };
            if (_scrollBar.horizontal)
            {
                limits.minWidth = width;
            }
            else
            {
                limits.minHeight = height;
            };
        }

        public function get scrollbarOffsetX():Number
        {
            return (_SafeStr_5515);
        }

        public function get scrollbarOffsetY():Number
        {
            return (_SafeStr_5516);
        }

        public function set scrollbarOffsetX(_arg_1:Number):void
        {
        }

        public function set scrollbarOffsetY(_arg_1:Number):void
        {
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            var _local_3:* = null;
            if (_arg_2.type == "WE_RELOCATED")
            {
                _SafeStr_5515 = ((x != 0) ? (x / (_parent.width - width)) : 0);
                _SafeStr_5516 = ((y != 0) ? (y / (_parent.height - height)) : 0);
                if (_parent != _scrollBar)
                {
                    _local_3 = _SafeStr_3116.allocate("WE_CHILD_RELOCATED", this, null);
                    _scrollBar.update(this, _local_3);
                    _local_3.recycle();
                };
            };
            return (super.update(_arg_1, _arg_2));
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3244 = "_-tJ" (String#9937, DoABC#4)
// _SafeStr_5515 = "_-c1C" (String#12697, DoABC#4)
// _SafeStr_5516 = "_-61N" (String#11572, DoABC#4)


