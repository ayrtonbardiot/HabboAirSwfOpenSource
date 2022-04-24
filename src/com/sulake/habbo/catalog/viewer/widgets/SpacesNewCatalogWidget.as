// by nota

//com.sulake.habbo.catalog.viewer.widgets.SpacesNewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.catalog.viewer.IItemGrid;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.session.ISessionDataManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.ProductContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer._SafeStr_3266;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class SpacesNewCatalogWidget extends ItemGridCatalogWidget implements _SafeStr_13, _SafeStr_3303, IItemGrid 
    {

        private var _SafeStr_6635:Array = ["wallpaper", "floor", "landscape"];
        private var _SafeStr_6633:Array = [];
        private var _selectedGroup:int = 0;
        private var _SafeStr_6634:Array = [0, 0, 0];
        private var _SafeStr_3742:ISelectorWindow;
        private var _SafeStr_3921:Array = ["group.walls", "group.floors", "group.views"];

        public function SpacesNewCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:ISessionDataManager, _arg_3:String)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            super.dispose();
            for each (var _local_2:Vector.<_SafeStr_3141> in _SafeStr_6633)
            {
                for each (var _local_1:_SafeStr_3141 in _local_2)
                {
                    _local_1.dispose();
                };
            };
            _SafeStr_6633 = null;
        }

        override public function init():Boolean
        {
            var _local_2:int;
            var _local_1:* = null;
            _SafeStr_14.log("Init Item Group Catalog Widget (Spaces New)");
            createOfferGroups();
            if (!super.init())
            {
                return (false);
            };
            events.addEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
            _SafeStr_3742 = (_window.findChildByName("groups") as ISelectorWindow);
            if (_SafeStr_3742)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_3742.numSelectables)
                {
                    _local_1 = _SafeStr_3742.getSelectableAt(_local_2);
                    if ((_local_1 is ISelectableWindow))
                    {
                        _local_1.addEventListener("WE_SELECTED", onSelectGroup);
                    };
                    _local_2++;
                };
            };
            switchCategory(_SafeStr_3921[_selectedGroup]);
            updateRoomPreview();
            return (true);
        }

        public function onWidgetsInitialized(_arg_1:CatalogWidgetEvent):void
        {
            var _local_3:int = _SafeStr_6634[_selectedGroup];
            var _local_2:_SafeStr_3141 = _SafeStr_6633[_selectedGroup][_local_3];
            this.select(_local_2.gridItem, false);
        }

        public function selectIndex(_arg_1:int):void
        {
            var _local_2:* = null;
            if (((_arg_1 > -1) && (_arg_1 < _itemGrid.numGridItems)))
            {
                _local_2 = _SafeStr_6633[_selectedGroup][_arg_1];
                this.select(_local_2.gridItem, false);
            };
        }

        override public function select(_arg_1:_SafeStr_3266, _arg_2:Boolean):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            super.select(_arg_1, false);
            var _local_3:_SafeStr_3141 = (_arg_1 as ProductContainer).offer;
            if (_local_3 == null)
            {
                return;
            };
            events.dispatchEvent(new SetExtraPurchaseParameterEvent(_local_3.product.extraParam));
            _SafeStr_6634[_selectedGroup] = (_SafeStr_6633[_selectedGroup] as Vector.<_SafeStr_3141>).indexOf(_local_3);
            updateRoomPreview();
        }

        private function updateRoomPreview():void
        {
            var _local_5:int = _SafeStr_6634[0];
            var _local_6:int = _SafeStr_6634[1];
            var _local_3:int = _SafeStr_6634[2];
            var _local_2:_SafeStr_3141 = ((_SafeStr_6633[0].length > _local_5) ? _SafeStr_6633[0][_local_5] : null);
            var _local_4:_SafeStr_3141 = ((_SafeStr_6633[1].length > _local_6) ? _SafeStr_6633[1][_local_6] : null);
            var _local_1:_SafeStr_3141 = ((_SafeStr_6633[2].length > _local_3) ? _SafeStr_6633[2][_local_3] : null);
            if ((((!(_local_4)) || (!(_local_2))) || (!(_local_1))))
            {
                return;
            };
            events.dispatchEvent(new CatalogWidgetUpdateRoomPreviewEvent(_local_4.product.extraParam, _local_2.product.extraParam, _local_1.product.extraParam, 64));
        }

        private function createOfferGroups():Boolean
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_4:* = null;
            var _local_5:int;
            for each (var _local_1:_SafeStr_3141 in page.offers)
            {
                if (((_local_1.pricingModel == "pricing_model_single") || (_local_1.pricingModel == "pricing_model_multi")))
                {
                    _local_2 = _local_1.product;
                    if (_local_2 != null)
                    {
                        _local_3 = _local_2.productClassId;
                        if (((_local_2.productType == "i") || (_local_2.productType == "s")))
                        {
                            if (_local_2.furnitureData != null)
                            {
                                _local_4 = _local_2.furnitureData.className;
                                _local_5 = _SafeStr_6635.indexOf(_local_4);
                                if (_SafeStr_6635.indexOf(_local_4) == -1)
                                {
                                    _SafeStr_6635.push(_local_4);
                                };
                                while (_SafeStr_6633.length < _SafeStr_6635.length)
                                {
                                    _SafeStr_6633.push(new Vector.<_SafeStr_3141>(0));
                                };
                                switch (_local_4)
                                {
                                    case "floor":
                                        (_SafeStr_6633[_local_5] as Vector.<_SafeStr_3141>).push(_local_1);
                                        break;
                                    case "wallpaper":
                                        (_SafeStr_6633[_local_5] as Vector.<_SafeStr_3141>).push(_local_1);
                                        break;
                                    case "landscape":
                                        (_SafeStr_6633[_local_5] as Vector.<_SafeStr_3141>).push(_local_1);
                                        break;
                                    default:
                                        _SafeStr_14.log(("[Spaces Catalog Widget] : " + _local_4));
                                };
                            };
                        };
                    };
                };
            };
            page.replaceOffers(new Vector.<_SafeStr_3141>(0), false);
            return (true);
        }

        private function onSelectGroup(_arg_1:_SafeStr_3116):void
        {
            var _local_2:int;
            var _local_3:ISelectableWindow = (_arg_1.target as ISelectableWindow);
            if (_local_3)
            {
                _local_2 = _SafeStr_3742.getSelectableIndex(_local_3);
                _SafeStr_14.log(("select: " + [_local_3.name, _local_2]));
                switchCategory(_local_3.name);
            };
        }

        private function switchCategory(_arg_1:String):void
        {
            var _local_2:*;
            var _local_3:int;
            if (disposed)
            {
                return;
            };
            if (!_SafeStr_3742)
            {
                return;
            };
            _SafeStr_3742.setSelected(_SafeStr_3742.getSelectableByName(_arg_1));
            var _local_4:int = -1;
            switch (_arg_1)
            {
                case "group.walls":
                    _local_4 = 0;
                    break;
                case "group.floors":
                    _local_4 = 1;
                    break;
                case "group.views":
                    _local_4 = 2;
                    break;
                default:
                    _local_4 = -1;
            };
            if (_local_4 > -1)
            {
                if (_SafeStr_5575 != null)
                {
                    _SafeStr_5575.deactivate();
                };
                _SafeStr_5575 = null;
                _selectedGroup = _local_4;
                if (_itemGrid)
                {
                    _itemGrid.destroyGridItems();
                };
                _local_2 = ((_SafeStr_6633[_selectedGroup] == null) ? new Vector.<_SafeStr_3141>(0) : _SafeStr_6633[_selectedGroup]);
                page.replaceOffers(_local_2, false);
                resetTimer();
                populateItemGrid();
                loadItemGridGraphics();
                if (_SafeStr_4582)
                {
                    _SafeStr_4582.start();
                };
                _local_3 = _SafeStr_6634[_selectedGroup];
                selectIndex(_local_3);
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3742 = "_-p7" (String#1631, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5575 = "_-c4" (String#1493, DoABC#4)
// _SafeStr_6633 = "_-VR" (String#3544, DoABC#4)
// _SafeStr_6634 = "_-xE" (String#8653, DoABC#4)
// _SafeStr_6635 = "_-EI" (String#11170, DoABC#4)


