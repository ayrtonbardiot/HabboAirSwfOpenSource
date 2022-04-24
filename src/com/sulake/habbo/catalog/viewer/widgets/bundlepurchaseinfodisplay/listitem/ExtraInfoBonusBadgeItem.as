// by nota

//com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusBadgeItem

package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;

    public class ExtraInfoBonusBadgeItem extends ExtraInfoListItem implements _SafeStr_3140 
    {

        private var _catalog:HabboCatalog;

        public function ExtraInfoBonusBadgeItem(_arg_1:int, _arg_2:ExtraInfoItemData, _arg_3:HabboCatalog)
        {
            super(null, _arg_1, _arg_2, 0);
            _catalog = _arg_3;
        }

        override public function getRenderedWindow():_SafeStr_3133
        {
            return (null);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
        }

        public function imageFailed(_arg_1:int):void
        {
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)


