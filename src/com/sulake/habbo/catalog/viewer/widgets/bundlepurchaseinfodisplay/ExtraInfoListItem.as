// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
    import com.sulake.core.window._SafeStr_3133;

    public class ExtraInfoListItem implements _SafeStr_13 
    {

        public static const ALIGN_TOP:int = 0;
        public static const ALIGN_BOTTOM:int = 1;
        public static const ALIGN_OVERLAY:int = 2;

        private var _SafeStr_3820:int;
        private var _SafeStr_3740:ExtraInfoItemData;
        private var _SafeStr_5037:int;
        private var _alwaysOnTop:Boolean;
        private var _disposed:Boolean = false;
        private var _SafeStr_6964:Number;
        private var _SafeStr_6966:Number;
        private var _SafeStr_6965:Boolean = false;

        public function ExtraInfoListItem(_arg_1:BundlePurchaseExtraInfoWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:int=0, _arg_5:Boolean=false)
        {
            _SafeStr_3820 = _arg_2;
            _SafeStr_3740 = _arg_3;
            _SafeStr_5037 = _arg_4;
            _alwaysOnTop = _arg_5;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
            _disposed = true;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function get data():ExtraInfoItemData
        {
            return (_SafeStr_3740);
        }

        public function set data(_arg_1:ExtraInfoItemData):void
        {
            _SafeStr_3740 = _arg_1;
        }

        public function get alignment():int
        {
            return (_SafeStr_5037);
        }

        public function get alwaysOnTop():Boolean
        {
            return (_alwaysOnTop);
        }

        public function get creationSeconds():Number
        {
            return (_SafeStr_6964);
        }

        public function set creationSeconds(_arg_1:Number):void
        {
            _SafeStr_6964 = _arg_1;
        }

        public function get isItemRemoved():Boolean
        {
            return (_SafeStr_6965);
        }

        public function get removalSeconds():Number
        {
            return (_SafeStr_6966);
        }

        public function set removalSeconds(_arg_1:Number):void
        {
            _SafeStr_6966 = _arg_1;
            _SafeStr_6965 = true;
        }

        public function getRenderedWindow():_SafeStr_3133
        {
            return (null);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5037 = "_-O11" (String#4228, DoABC#4)
// _SafeStr_6964 = "_-6n" (String#22159, DoABC#4)
// _SafeStr_6965 = "_-a1Z" (String#15958, DoABC#4)
// _SafeStr_6966 = "_-yJ" (String#18515, DoABC#4)


