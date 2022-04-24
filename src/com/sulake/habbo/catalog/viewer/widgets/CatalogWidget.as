// by nota

//com.sulake.habbo.catalog.viewer.widgets.CatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.catalog.viewer._SafeStr_3211;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;

    public class CatalogWidget implements _SafeStr_3303 
    {

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_3983:IEventDispatcher;
        private var _SafeStr_4715:_SafeStr_3211;
        private var _SafeStr_4036:Boolean;
        protected var _isEmbedded:Boolean = false;

        public function CatalogWidget(_arg_1:_SafeStr_3133)
        {
            _window = _arg_1;
            _isEmbedded = (_arg_1.tags.indexOf("EMBEDDED") > -1);
        }

        public function set page(_arg_1:_SafeStr_3211):void
        {
            _SafeStr_4715 = _arg_1;
        }

        public function set events(_arg_1:IEventDispatcher):void
        {
            _SafeStr_3983 = _arg_1;
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function get events():IEventDispatcher
        {
            return (_SafeStr_3983);
        }

        public function get page():_SafeStr_3211
        {
            return (_SafeStr_4715);
        }

        public function dispose():void
        {
            _SafeStr_3983 = null;
            _SafeStr_4715 = null;
            _window = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function init():Boolean
        {
            return (true);
        }

        public function closed():void
        {
        }

        protected function getAssetXML(_arg_1:String):XML
        {
            if (((((!(page)) || (!(page.viewer))) || (!(page.viewer.catalog))) || (!(page.viewer.catalog.assets))))
            {
                return (null);
            };
            var _local_2:XmlAsset = (page.viewer.catalog.assets.getAssetByName(_arg_1) as XmlAsset);
            if (_local_2 == null)
            {
                return (null);
            };
            return (_local_2.content as XML);
        }

        protected function attachWidgetView(_arg_1:String):void
        {
            if (_isEmbedded)
            {
                return;
            };
            var _local_2:XML = getAssetXML(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            window.removeChildAt(0);
            if (((((!(window)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))))
            {
                return;
            };
            window.addChild(page.viewer.catalog.windowManager.buildFromXML(_local_2));
        }

        protected function getAssetBitmapData(_arg_1:String):BitmapData
        {
            var _local_2:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_2 == null)
            {
                return (null);
            };
            return (_local_2.content as BitmapData);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)


