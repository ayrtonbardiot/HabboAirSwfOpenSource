// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.BuilderCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import _-r1a._SafeStr_474;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class BuilderCatalogWidget extends CatalogWidget implements _SafeStr_3303, _SafeStr_13 
    {

        private var _catalog:HabboCatalog;
        private var _offer:_SafeStr_3141;
        private var _SafeStr_6784:_SafeStr_474;

        public function BuilderCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
            _SafeStr_6784 = new _SafeStr_474(onYouAreOwner);
            _catalog.connection.addMessageEvent(_SafeStr_6784);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (((!(_catalog == null)) && (!(_catalog.connection == null))))
            {
                _catalog.connection.removeMessageEvent(_SafeStr_6784);
                _SafeStr_6784 = null;
                _catalog = null;
            };
            events.removeEventListener("SELECT_PRODUCT", onSelectProduct);
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            if (_catalog.catalogType != "BUILDERS_CLUB")
            {
                _window.visible = false;
                return (true);
            };
            attachWidgetView("builderWidget");
            updateButtons(false);
            _window.procedure = windowProcedure;
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            events.addEventListener("CWE_ROOM_CHANGED", onRoomChanged);
            return (true);
        }

        private function onRoomChanged(_arg_1:CatalogWidgetRoomChangedEvent):void
        {
            updateButtons(false);
        }

        private function onYouAreOwner(_arg_1:_SafeStr_474):void
        {
            if (_catalog.catalogType != "BUILDERS_CLUB")
            {
                return;
            };
            updateButtons(true);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "place_one":
                    _catalog.requestSelectedItemToMover(null, _offer);
                    return;
                case "place_many":
                    _catalog.requestSelectedItemToMover(null, _offer, true);
                    return;
            };
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            _offer = _arg_1.offer;
            updateButtons(false);
        }

        private function updateButtons(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            if (((!(_window)) || (!(_window.visible))))
            {
                return;
            };
            var _local_3:int = _catalog.getBuilderFurniPlaceableStatus(_offer);
            if (((_local_3 == 4) && (_arg_1)))
            {
                _local_3 = 0;
            };
            if (_local_3 == 0)
            {
                _SafeStr_3122(_window.findChildByName("place_one")).enable();
                _SafeStr_3122(_window.findChildByName("place_many")).enable();
                _window.findChildByName("error_container").visible = false;
            }
            else
            {
                _SafeStr_3122(_window.findChildByName("place_one")).disable();
                _SafeStr_3122(_window.findChildByName("place_many")).disable();
                _window.findChildByName("error_container").visible = true;
                _local_2 = (_window.findChildByName("error_icon") as IStaticBitmapWrapperWindow);
                _local_4 = _window.findChildByName("error_message");
                switch (_local_3)
                {
                    case 1:
                        _window.findChildByName("error_container").visible = false;
                        return;
                    case 2:
                        _local_2.assetUri = "icons_builder_error_furnilimit";
                        _local_4.caption = "${builder.placement_widget.error.limit_reached}";
                        return;
                    case 3:
                        _local_2.assetUri = "icons_builder_error_notroom";
                        _local_4.caption = "${builder.placement_widget.error.not_in_room}";
                        return;
                    case 4:
                        _local_2.assetUri = "icons_builder_error_room";
                        _local_4.caption = "${builder.placement_widget.error.not_room_owner}";
                        return;
                    case 5:
                        _local_2.assetUri = "icons_builder_error_grouproom";
                        _local_4.caption = "${builder.placement_widget.error.group_room}";
                        return;
                    case 6:
                        _local_2.assetUri = "icons_builder_error_userinroom";
                        _local_4.caption = "${builder.placement_widget.error.visitors}";
                    default:
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_474 = "_-w1M" (String#9691, DoABC#4)
// _SafeStr_6784 = "_-2o" (String#10647, DoABC#4)


