// by nota

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;

    public class CatalogWidgetBundleDisplayExtraInfoEvent extends Event 
    {

        public static const RESET:String = "CWPPEIE_RESET";
        public static const HIDE:String = "CWPPEIE_HIDE";
        public static const ITEM_CLICKED:String = "CWPPEIE_ITEM_CLICKED";

        private var _SafeStr_3820:int;
        private var _SafeStr_3740:ExtraInfoItemData;

        public function CatalogWidgetBundleDisplayExtraInfoEvent(_arg_1:String, _arg_2:ExtraInfoItemData=null, _arg_3:int=-1)
        {
            super(_arg_1);
            _SafeStr_3820 = _arg_3;
            _SafeStr_3740 = _arg_2;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get data():ExtraInfoItemData
        {
            return (_SafeStr_3740);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


