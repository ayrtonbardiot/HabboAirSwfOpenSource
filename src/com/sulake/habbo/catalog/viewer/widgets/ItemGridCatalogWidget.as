// by nota

//com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.viewer.IItemGrid;
    import com.sulake.habbo.catalog.viewer._SafeStr_3214;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.viewer._SafeStr_3266;
    import flash.utils.Timer;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.ProductContainer;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.viewer.BundleProductContainer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer._SafeStr_3300;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;

    public class ItemGridCatalogWidget extends CatalogWidget implements _SafeStr_3303, IItemGrid, _SafeStr_3214 
    {

        protected var _itemGrid:IItemGridWindow;
        protected var _gridItemLayout:XML;
        protected var _SafeStr_6629:XML;
        protected var _SafeStr_6630:XML;
        protected var _SafeStr_5575:_SafeStr_3266;
        private var _bundleCounter:int = 0;
        protected var _SafeStr_4582:Timer;
        protected var _SafeStr_6628:Boolean = true;
        private var _offerInitIndex:int = 0;
        protected var _session:ISessionDataManager;
        private var _SafeStr_6631:int = -1;
        private var _selectedGuildColor1:String;
        private var _selectedGuildColor2:String;
        private var _SafeStr_6632:String;
        private var _SafeStr_3864:String;
        public var itemColors:Dictionary = new Dictionary();
        public var chosenItemColorIndex:int = 0;
        private var lastChosenColorIndex:int = 0;

        public function ItemGridCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:ISessionDataManager, _arg_3:String)
        {
            super(_arg_1);
            _session = _arg_2;
            _SafeStr_3864 = _arg_3;
        }

        override public function dispose():void
        {
            if (_SafeStr_4582 != null)
            {
                _SafeStr_4582.stop();
                _SafeStr_4582.removeEventListener("timer", loadItemGridGraphics);
                _SafeStr_4582 = null;
            };
            if (_itemGrid != null)
            {
                _itemGrid.destroyGridItems();
                _itemGrid = null;
            };
            _gridItemLayout = null;
            _SafeStr_6629 = null;
            _SafeStr_6630 = null;
            _SafeStr_5575 = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("itemGridWidget");
            var _local_2:* = (_window.tags.indexOf("FIXED") > -1);
            _itemGrid = (_window.findChildByName("itemGrid") as IItemGridWindow);
            if (!_local_2)
            {
                _window.getChildAt(0).width = _window.width;
                _window.getChildAt(0).height = _window.height;
            };
            _itemGrid.verticalSpacing = 0;
            var _local_1:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            _gridItemLayout = (_local_1.content as XML);
            _local_1 = (page.viewer.catalog.assets.getAssetByName("grid_item_with_price_single") as XmlAsset);
            _SafeStr_6630 = (_local_1.content as XML);
            _local_1 = (page.viewer.catalog.assets.getAssetByName("grid_item_with_price_multi") as XmlAsset);
            _SafeStr_6629 = (_local_1.content as XML);
            populateItemGrid();
            if (_SafeStr_6628)
            {
                _SafeStr_4582 = new Timer(25);
                _SafeStr_4582.addEventListener("timer", loadItemGridGraphics);
                _SafeStr_4582.start();
            }
            else
            {
                loadItemGridGraphics();
            };
            events.addEventListener("GUILD_SELECTED", onGuildSelected);
            events.addEventListener("COLOUR_INDEX", onColourIndex);
            return (true);
        }

        public function select(_arg_1:_SafeStr_3266, _arg_2:Boolean):void
        {
            if (_SafeStr_5575 != null)
            {
                _SafeStr_5575.deactivate();
            };
            _SafeStr_5575 = _arg_1;
            _arg_1.activate();
            if (_SafeStr_5575.view)
            {
                _SafeStr_5575.view.findChildByName("border_outline").color = ((_SafeStr_3864 == "NORMAL") ? 6538729 : 16758076);
            };
            var _local_4:ProductContainer = (_arg_1 as ProductContainer);
            if (!_local_4)
            {
                return;
            };
            if (_local_4.isLazy)
            {
                return;
            };
            var _local_3:_SafeStr_3141 = _local_4.offer;
            if (_local_3 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_3));
                if (((_local_3.product) && (_local_3.product.productType == "i")))
                {
                    events.dispatchEvent(new SetExtraPurchaseParameterEvent(_local_3.product.extraParam));
                };
            };
            if (_arg_2)
            {
                events.dispatchEvent(new CatalogWidgetColoursEvent(getCurrentItemColors(), "ctlg_clr_27x22_1", "ctlg_clr_27x22_2", "ctlg_clr_27x22_3", getCurrentItemColourIndex()));
            };
        }

        public function startDragAndDrop(_arg_1:_SafeStr_3266):Boolean
        {
            var _local_2:_SafeStr_3141 = (_arg_1 as ProductContainer).offer;
            if (_local_2 != null)
            {
                if (_session.clubLevel >= _local_2.clubLevel)
                {
                    (page.viewer.catalog as HabboCatalog).requestSelectedItemToMover(this, _local_2);
                };
            };
            return (true);
        }

        public function onDragAndDropDone(_arg_1:Boolean, _arg_2:String):void
        {
            if (disposed)
            {
                return;
            };
            if (_arg_1)
            {
                events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false, _arg_2));
            };
        }

        public function stopDragAndDrop():void
        {
        }

        protected function populateItemGrid():void
        {
            var _local_4:* = null;
            var _local_5:int;
            var _local_1:* = null;
            var _local_2:uint;
            var _local_3:int;
            var _local_7:Array = [];
            var _local_6:Vector.<_SafeStr_3141> = new Vector.<_SafeStr_3141>();
            if (page.layoutCode == "default_3x3_color_grouping")
            {
                page.offers.sort(sortByColourIndex);
                for each (_local_1 in page.offers)
                {
                    if (((!(_local_1.product.furnitureData)) || (!(_local_1.product.isColorable))))
                    {
                        _local_6.push(_local_1);
                    }
                    else
                    {
                        _local_4 = _local_1.product.furnitureData.fullName.split("*")[0];
                        _local_5 = _local_1.product.furnitureData.fullName.split("*")[1];
                        if (!itemColors[_local_4])
                        {
                            itemColors[_local_4] = [];
                        };
                        if (_local_1.product.furnitureData.colours)
                        {
                            for each (_local_2 in _local_1.product.furnitureData.colours)
                            {
                                if (_local_2 != 0xFFFFFF)
                                {
                                    _local_3 = _local_2;
                                };
                            };
                            if (itemColors[_local_4].indexOf(_local_3) == -1)
                            {
                                itemColors[_local_4][_local_5] = _local_3;
                            };
                        };
                        if (_local_7.indexOf(_local_4) == -1)
                        {
                            _local_6.push(_local_1);
                            _local_7.push(_local_4);
                        };
                    };
                };
                page.offers.sort(sortByFurniTypeName);
            }
            else
            {
                _local_6 = page.offers;
            };
            for each (_local_1 in page.offers)
            {
                createGridItem(_local_1.gridItem, (!(_local_6.indexOf(_local_1) == -1)));
                _local_1.gridItem.grid = this;
                if (_local_1.pricingModel == "pricing_model_bundle")
                {
                    _bundleCounter++;
                    if ((_local_1.productContainer is BundleProductContainer))
                    {
                        (_local_1.productContainer as BundleProductContainer).setBundleCounter(_bundleCounter);
                    };
                };
            };
        }

        private function sortByColourIndex(_arg_1:_SafeStr_3141, _arg_2:_SafeStr_3141):int
        {
            if (((!(_arg_1.product.furnitureData.colourIndex)) || (!(_arg_2.product.furnitureData.colourIndex))))
            {
                return (1);
            };
            if (_arg_1.product.furnitureData.colourIndex > _arg_2.product.furnitureData.colourIndex)
            {
                return (1);
            };
            if (_arg_1 == _arg_2)
            {
                return (0);
            };
            return (-1);
        }

        private function sortByFurniTypeName(_arg_1:_SafeStr_3141, _arg_2:_SafeStr_3141):int
        {
            if (_arg_1.product.furnitureData.className > _arg_2.product.furnitureData.className)
            {
                return (1);
            };
            if (_arg_1 == _arg_2)
            {
                return (0);
            };
            return (-1);
        }

        protected function resetTimer():void
        {
            if (_SafeStr_4582 != null)
            {
                _SafeStr_4582.reset();
            };
            _offerInitIndex = 0;
        }

        protected function loadItemGridGraphics(_arg_1:TimerEvent=null):void
        {
            var _local_4:int;
            var _local_2:* = null;
            if (disposed)
            {
                return;
            };
            if (_arg_1 != null)
            {
            };
            var _local_3:int = page.offers.length;
            if (_local_3 > 0)
            {
                _local_4 = 0;
                while (_local_4 < 3)
                {
                    if (((_offerInitIndex >= 0) && (_offerInitIndex < _local_3)))
                    {
                        _local_2 = page.offers[_offerInitIndex];
                        loadGraphics(_local_2);
                        _local_2.productContainer.grid = this;
                    };
                    _offerInitIndex++;
                    if (_offerInitIndex >= _local_3)
                    {
                        resetTimer();
                        return;
                    };
                    _local_4++;
                };
            };
        }

        protected function createGridItem(_arg_1:_SafeStr_3266, _arg_2:Boolean=true):void
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_3300 = (_arg_1 as _SafeStr_3300);
            var _local_6:Boolean = (((!(_local_4 == null)) && (!(_local_4.offer == null))) && ((_local_4.offer.priceInCredits > 0) || (_local_4.offer.priceInActivityPoints > 0)));
            if (((_local_6) && (!(_SafeStr_3864 == "BUILDERS_CLUB"))))
            {
                if ((((_local_4.offer) && (_local_4.offer.priceInCredits > 0)) && (_local_4.offer.priceInActivityPoints > 0)))
                {
                    _local_3 = _SafeStr_6629;
                }
                else
                {
                    _local_3 = _SafeStr_6630;
                };
            }
            else
            {
                _local_3 = _gridItemLayout;
            };
            var _local_5:_SafeStr_3133 = (page.viewer.catalog.windowManager.buildFromXML(_local_3) as _SafeStr_3133);
            if (_arg_2)
            {
                _itemGrid.addGridItem(_local_5);
            };
            _arg_1.view = _local_5;
            if ((_local_4 is ProductContainer))
            {
                (_local_4 as ProductContainer).createCurrencyIndicators((page.viewer.catalog as HabboCatalog));
            };
        }

        protected function loadGraphics(_arg_1:_SafeStr_3141):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            if (((!(_arg_1 == null)) && (!(_arg_1.disposed))))
            {
                _local_3 = null;
                if (_SafeStr_6631 != -1)
                {
                    _local_2 = [];
                    _local_2.push("0");
                    _local_2.push(_SafeStr_6631.toString());
                    _local_2.push(_SafeStr_6632);
                    _local_2.push(_selectedGuildColor1);
                    _local_2.push(_selectedGuildColor2);
                    _local_4 = new StringArrayStuffData();
                    _local_4.setArray(_local_2);
                    _local_3 = _local_4;
                };
                _arg_1.productContainer.initProductIcon(page.viewer.roomEngine, _local_3);
            };
        }

        private function onGuildSelected(_arg_1:CatalogWidgetGuildSelectedEvent):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_6631 = _arg_1.guildId;
            _selectedGuildColor1 = _arg_1.color1;
            _selectedGuildColor2 = _arg_1.color2;
            _SafeStr_6632 = _arg_1.badgeCode;
            _itemGrid.destroyGridItems();
            for each (var _local_2:_SafeStr_3141 in page.offers)
            {
                createGridItem(_local_2.gridItem);
                loadGraphics(_local_2);
                _local_2.productContainer.grid = this;
            };
        }

        private function removeColorableGridItemIfExists(_arg_1:_SafeStr_3141):void
        {
            if (_itemGrid.getGridItemIndex(_arg_1.gridItem.view) >= 0)
            {
                _itemGrid.removeGridItem(_arg_1.gridItem.view);
            };
        }

        private function onColourIndex(_arg_1:CatalogWidgetColourIndexEvent):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_5:int;
            for each (_local_2 in page.offers)
            {
                if (_local_2.gridItem == _SafeStr_5575)
                {
                    _local_3 = _local_2;
                };
            };
            if (((!(_local_3)) || (!(_local_3.product.isColorable))))
            {
                return;
            };
            _local_5 = _itemGrid.getGridItemIndex(_local_3.gridItem.view);
            removeColorableGridItemIfExists(_local_3);
            var _local_4:String = ((_local_3.product.furnitureData.fullName.split("*")[0] + "*") + (_arg_1.index + 1));
            for each (_local_2 in page.offers)
            {
                if (_local_2.product.furnitureData.fullName == _local_4)
                {
                    _itemGrid.addGridItemAt(_local_2.gridItem.view, _local_5);
                    select(_local_2.gridItem, false);
                    _local_2.gridItem.grid = this;
                };
            };
        }

        public function getCurrentItemColors():Array
        {
            var _local_2:* = null;
            for each (var _local_1:_SafeStr_3141 in page.offers)
            {
                if (_local_1.gridItem == _SafeStr_5575)
                {
                    _local_2 = _local_1;
                };
            };
            if (((!(_local_2)) || (!(_local_2.product.isColorable))))
            {
                return ([]);
            };
            var _local_3:String = _local_2.product.furnitureData.fullName.split("*")[0];
            if ((((!(_local_3 == null)) && (_local_3.indexOf("bc_alpha") >= 0)) && (!(itemColors[_local_3] == null))))
            {
                return (itemColors[_local_3].concat("0xffffff"));
            };
            return (itemColors[_local_3]);
        }

        private function getCurrentItemColourIndex():int
        {
            var _local_2:* = null;
            for each (var _local_1:_SafeStr_3141 in page.offers)
            {
                if (_local_1.gridItem == _SafeStr_5575)
                {
                    _local_2 = _local_1;
                };
            };
            if (((!(_local_2)) || (!(_local_2.product.isColorable))))
            {
                return (0);
            };
            return (Math.max((_local_2.product.furnitureData.colourIndex - 1), 0));
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3214 = "_-H1a" (String#6911, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3864 = "_-Qc" (String#2490, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5575 = "_-c4" (String#1493, DoABC#4)
// _SafeStr_6628 = "_-sz" (String#29151, DoABC#4)
// _SafeStr_6629 = "_-81D" (String#13206, DoABC#4)
// _SafeStr_6630 = "_-oN" (String#11820, DoABC#4)
// _SafeStr_6631 = "_-jr" (String#15439, DoABC#4)
// _SafeStr_6632 = "_-b1K" (String#15833, DoABC#4)


