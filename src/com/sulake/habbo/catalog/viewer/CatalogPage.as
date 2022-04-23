// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.CatalogPage

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.catalog.viewer.widgets._SafeStr_3303;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SongDiskProductViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpacesNewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RoomPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.AddOnBadgeViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.NewPetsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RoomAdsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.VipBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.LoyaltyVipBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ActivityPointDisplayCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MadMoneyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuyGuildWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildBadgeViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildForumSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PetPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpinnerCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TotalPriceWidget;
    import com.sulake.habbo.catalog.viewer.widgets.UniqueLimitedItemWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SoldLtdItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.UserBadgeSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SimplePriceCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderSubscriptionCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderAddonsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderLoyaltyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.WarningCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.FirstProductSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.FeaturedItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.events.ProductOfferUpdatedEvent;

    public class CatalogPage implements _SafeStr_3211 
    {

        protected static const LAYOUT_MAGIC_PREFIX:String = "layout_";
        public static const MODE_NORMAL:int = 0;
        public static const MODE_SEARCH:int = 1;

        protected var _layout:XML;
        protected var _window:_SafeStr_3133;
        private var _SafeStr_6491:_SafeStr_3229;
        private var _SafeStr_4786:int;
        private var _SafeStr_6492:String;
        private var _offers:Vector.<_SafeStr_3141>;
        private var _localization:IPageLocalization;
        private var _SafeStr_4346:Array = [];
        private var _widgetEvents:EventDispatcherWrapper;
        private var _catalog:HabboCatalog;
        private var _SafeStr_8361:int;
        private var _SafeStr_6494:ItemGridCatalogWidget;
        private var _SafeStr_6493:Boolean;
        private var _SafeStr_3771:int;

        public function CatalogPage(_arg_1:_SafeStr_3229, _arg_2:int, _arg_3:String, _arg_4:IPageLocalization, _arg_5:Vector.<_SafeStr_3141>, _arg_6:HabboCatalog, _arg_7:Boolean, _arg_8:int=-1)
        {
            _SafeStr_6491 = _arg_1;
            _SafeStr_4786 = _arg_2;
            _SafeStr_6492 = _arg_3;
            _localization = _arg_4;
            _offers = _arg_5;
            _catalog = _arg_6;
            for each (var _local_9:_SafeStr_3141 in _arg_5)
            {
                _local_9.page = this;
            };
            _widgetEvents = new EventDispatcherWrapper();
            _SafeStr_4346 = [];
            _SafeStr_6493 = _arg_7;
            if (_arg_8 == -1)
            {
                _SafeStr_3771 = 0;
            }
            else
            {
                _SafeStr_3771 = _arg_8;
            };
            init();
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function get viewer():_SafeStr_3229
        {
            return (_SafeStr_6491);
        }

        public function get pageId():int
        {
            return ((_SafeStr_3771 == 1) ? -12345678 : _SafeStr_4786);
        }

        public function get layoutCode():String
        {
            return (_SafeStr_6492);
        }

        public function get offers():Vector.<_SafeStr_3141>
        {
            return (_offers);
        }

        public function get localization():IPageLocalization
        {
            return (_localization);
        }

        public function get links():Array
        {
            return (_localization.getLinks(_SafeStr_6492));
        }

        public function get hasLinks():Boolean
        {
            return (_localization.hasLinks(_SafeStr_6492));
        }

        public function get acceptSeasonCurrencyAsCredits():Boolean
        {
            return (_SafeStr_6493);
        }

        public function get allowDragging():Boolean
        {
            return (!(_SafeStr_6492 == "sold_ltd_items"));
        }

        public function set searchPageId(_arg_1:int):void
        {
            _SafeStr_8361 = _arg_1;
        }

        public function get mode():int
        {
            return (_SafeStr_3771);
        }

        public function get isBuilderPage():Boolean
        {
            return (_catalog.catalogType == "BUILDERS_CLUB");
        }

        public function selectOffer(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (((!(_SafeStr_6494 == null)) && (_arg_1 > -1)))
            {
                _SafeStr_14.log(("selecting offer " + _arg_1));
                for each (var _local_2:_SafeStr_3141 in _offers)
                {
                    if (_local_2.offerId == _arg_1)
                    {
                        _local_3 = _local_2.gridItem;
                        _SafeStr_6494.select(_local_3, true);
                    };
                };
            };
            if (((_window) && (!(_window.findChildByName("trophyWidget") == null))))
            {
                _local_4 = (_window.findChildByName("input_text") as ITextFieldWindow);
                _local_4.focus();
                _local_4.activate();
            };
        }

        public function dispose():void
        {
            for each (var _local_2:_SafeStr_3303 in _SafeStr_4346)
            {
                _local_2.dispose();
            };
            _SafeStr_4346 = null;
            _localization.dispose();
            for each (var _local_1:_SafeStr_3141 in _offers)
            {
                _local_1.dispose();
            };
            _offers = new Vector.<_SafeStr_3141>(0);
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_widgetEvents != null)
            {
                _widgetEvents.dispose();
                _widgetEvents = null;
            };
            _SafeStr_6491 = null;
            _layout = null;
            _SafeStr_4786 = 0;
            _SafeStr_6492 = "";
            _SafeStr_6493 = false;
        }

        public function init():void
        {
            if (createWindow(layoutCode))
            {
                createWidgets();
            };
        }

        public function closed():void
        {
            if (_SafeStr_4346 != null)
            {
                for each (var _local_1:_SafeStr_3303 in _SafeStr_4346)
                {
                    _local_1.closed();
                };
            };
        }

        protected function createWindow(_arg_1:String):Boolean
        {
            if (_arg_1 == "frontpage4")
            {
                _arg_1 = "frontpage_featured";
            };
            var _local_2:String = ("layout_" + _arg_1);
            if (_SafeStr_6491.viewerTags.indexOf("UBUNTU") > -1)
            {
                if (!viewer.catalog.assets.hasAsset(_local_2))
                {
                    _local_2 = ("old_" + _local_2);
                };
            }
            else
            {
                _local_2 = ("old_" + _local_2);
            };
            var _local_3:XmlAsset = (viewer.catalog.assets.getAssetByName(_local_2) as XmlAsset);
            if (_local_3 == null)
            {
                _SafeStr_14.log(("Could not find asset for layout " + _local_2));
                return (false);
            };
            _layout = (_local_3.content as XML);
            _window = (viewer.catalog.windowManager.buildFromXML(_layout) as _SafeStr_3133);
            if (_window == null)
            {
                _SafeStr_14.log(("Could not create layout " + _arg_1));
                return (false);
            };
            return (true);
        }

        private function localize():void
        {
        }

        private function createWidgets():void
        {
            createWidgetsRecursion(_window);
            initializeWidgets();
        }

        private function createWidgetsRecursion(_arg_1:_SafeStr_3133):void
        {
            var _local_2:int;
            var _local_3:* = null;
            if (_arg_1 != null)
            {
                _local_2 = 0;
                while (_local_2 < _arg_1.numChildren)
                {
                    _local_3 = (_arg_1.getChildAt(_local_2) as _SafeStr_3133);
                    if (_local_3 != null)
                    {
                        createWidget(_local_3);
                        createWidgetsRecursion(_local_3);
                    };
                    _local_2++;
                };
            };
        }

        private function createWidget(_arg_1:_SafeStr_3133):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            switch (_arg_1.name)
            {
                case "itemGridWidget":
                    if (_SafeStr_6494 == null)
                    {
                        _SafeStr_6494 = new ItemGridCatalogWidget(_arg_1, _catalog.sessionDataManager, _catalog.catalogType);
                        _SafeStr_4346.push(_SafeStr_6494);
                    };
                    return;
                case "productViewWidget":
                    _SafeStr_4346.push(new ProductViewCatalogWidget(_arg_1, _catalog));
                    return;
                case "songDiskProductViewWidget":
                    _SafeStr_4346.push(new SongDiskProductViewCatalogWidget(_arg_1, _catalog));
                    return;
                case "singleViewWidget":
                    _SafeStr_4346.push(new SingleViewCatalogWidget(_arg_1, _catalog));
                    return;
                case "purchaseWidget":
                    _SafeStr_4346.push(new PurchaseCatalogWidget(_arg_1, _catalog));
                    return;
                case "colourGridWidget":
                    _SafeStr_4346.push(new ColourGridCatalogWidget(_arg_1));
                    return;
                case "traxPreviewWidget":
                    _SafeStr_4346.push(new TraxPreviewCatalogWidget(_arg_1, _catalog.soundManager));
                    return;
                case "redeemItemCodeWidget":
                    _SafeStr_4346.push(new RedeemItemCodeCatalogWidget(_arg_1));
                    return;
                case "spacesNewWidget":
                    _SafeStr_4346.push(new SpacesNewCatalogWidget(_arg_1, _catalog.sessionDataManager, _catalog.catalogType));
                    return;
                case "roomPreviewWidget":
                    _SafeStr_4346.push(new RoomPreviewCatalogWidget(_arg_1));
                    return;
                case "trophyWidget":
                    _SafeStr_4346.push(new TrophyCatalogWidget(_arg_1, _catalog));
                    return;
                case "addOnBadgeViewWidget":
                    _SafeStr_4346.push(new AddOnBadgeViewCatalogWidget(_arg_1));
                    return;
                case "petsWidget":
                    _SafeStr_4346.push(new PetsCatalogWidget(_arg_1, _catalog));
                    return;
                case "newPetsWidget":
                    _SafeStr_4346.push(new NewPetsCatalogWidget(_arg_1, _catalog));
                    return;
                case "roomAdsCatalogWidget":
                    _SafeStr_4346.push(new RoomAdsCatalogWidget(_arg_1, _catalog));
                    return;
                case "textInputWidget":
                    _SafeStr_4346.push(new TextInputCatalogWidget(_arg_1));
                    return;
                case "specialInfoWidget":
                    _SafeStr_4346.push(new SpecialInfoWidget(_arg_1));
                    return;
                case "marketPlaceWidget":
                    _SafeStr_4346.push(new MarketPlaceCatalogWidget(_arg_1));
                    return;
                case "marketPlaceOwnItemsWidget":
                    _SafeStr_4346.push(new MarketPlaceOwnItemsCatalogWidget(_arg_1));
                    return;
                case "clubGiftWidget":
                    _SafeStr_4346.push(new ClubGiftWidget(_arg_1, _catalog.getClubGiftController(), _catalog));
                    return;
                case "clubBuyWidget":
                    _SafeStr_4346.push(new ClubBuyCatalogWidget(_arg_1));
                    return;
                case "vipBuyWidget":
                    _SafeStr_4346.push(new VipBuyCatalogWidget(_arg_1, _catalog));
                    return;
                case "loyaltyVipBuyWidget":
                    _SafeStr_4346.push(new LoyaltyVipBuyCatalogWidget(_arg_1, _catalog));
                    return;
                case "vipGiftWidget":
                    _SafeStr_4346.push(new VipBuyCatalogWidget(_arg_1, _catalog, true));
                    return;
                case "activityPointDisplayWidget":
                    _SafeStr_4346.push(new ActivityPointDisplayCatalogWidget(_arg_1));
                    return;
                case "madMoneyWidget":
                    _SafeStr_4346.push(new MadMoneyCatalogWidget(_arg_1));
                    return;
                case "buyGuildWidget":
                    _SafeStr_4346.push(new BuyGuildWidget(_arg_1));
                    return;
                case "guildBadgeViewWidget":
                    _SafeStr_4346.push(new GuildBadgeViewCatalogWidget(_arg_1, _catalog.getGroupMembershipsController()));
                    return;
                case "guildSelectorWidget":
                    _SafeStr_4346.push(new GuildSelectorCatalogWidget(_arg_1, _catalog.getGroupMembershipsController()));
                    return;
                case "guildForumSelectorWidget":
                    _SafeStr_4346.push(new GuildForumSelectorCatalogWidget(_arg_1, _catalog.getGroupMembershipsController()));
                    return;
                case "petPreviewWidget":
                    _SafeStr_4346.push(new PetPreviewCatalogWidget(_arg_1, _catalog));
                    return;
                case "spinnerWidget":
                    _SafeStr_4346.push(new SpinnerCatalogWidget(_arg_1, _catalog));
                    return;
                case "bundlePurchaseExtraInfoWidget":
                    _SafeStr_4346.push(new BundlePurchaseExtraInfoWidget(_arg_1, _catalog));
                    return;
                case "totalPriceWidget":
                    _SafeStr_4346.push(new TotalPriceWidget(_arg_1, _catalog));
                    return;
                case "limitedItemWidget":
                    _SafeStr_4346.push(new UniqueLimitedItemWidget(_arg_1, _catalog));
                    return;
                case "soldLtdItemsWidget":
                    _SafeStr_4346.push(new SoldLtdItemsCatalogWidget(_arg_1, _catalog));
                    return;
                case "userBadgeSelectorWidget":
                    _SafeStr_4346.push(new UserBadgeSelectorCatalogWidget(_arg_1, _catalog));
                    return;
                case "bundleGridScrollWidget":
                    _SafeStr_4346.push(new BundleGridViewCatalogWidget(_arg_1));
                    return;
                case "simplePriceWidget":
                    _SafeStr_4346.push(new SimplePriceCatalogWidget(_arg_1, _catalog));
                    return;
                case "builderWidget":
                    _SafeStr_4346.push(new BuilderCatalogWidget(_arg_1, _catalog));
                    return;
                case "builderSubscriptionWidget":
                    _SafeStr_4346.push(new BuilderSubscriptionCatalogWidget(_arg_1, _catalog));
                    return;
                case "builderAddonsWidget":
                    _SafeStr_4346.push(new BuilderAddonsCatalogWidget(_arg_1, _catalog));
                    return;
                case "builderLoyaltyWidget":
                    _SafeStr_4346.push(new BuilderLoyaltyCatalogWidget(_arg_1, _catalog));
                    return;
                case "warningWidget":
                    _SafeStr_4346.push(new WarningCatalogWidget(_arg_1));
                    return;
                case "firstProductAutoSelectorWidget":
                    _SafeStr_4346.push(new FirstProductSelectorCatalogWidget(_arg_1));
                    return;
                case "featuredItemsWidget":
                    _SafeStr_4346.push(new FeaturedItemsCatalogWidget(_arg_1, _catalog));
                    return;
            };
        }

        private function initializeWidgets():void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_1:* = null;
            var _local_4:int;
            var _local_5:* = null;
            var _local_2:Array = [];
            if (_SafeStr_6492 == "default_3x3_color_grouping")
            {
                _local_1 = (_window.findChildByName("itemGridWidget") as _SafeStr_3133);
                _local_4 = 3;
                _local_1.height = (104 - _local_4);
                _local_5 = (_window.findChildByName("colourGridWidget") as _SafeStr_3133);
                _local_5.visible = true;
                _local_5.width = 360;
                _local_5.x = _local_1.x;
                _local_5.y = ((_local_1.y + _local_1.height) + _local_4);
                _local_5.height = 51;
                _local_6 = new ColourGridCatalogWidget(_local_5);
                _SafeStr_4346.push(_local_6);
            };
            for each (_local_3 in _SafeStr_4346)
            {
                _local_3.page = this;
                if ((_local_3 is ItemGridCatalogWidget))
                {
                    _local_7 = (_local_3 as ItemGridCatalogWidget);
                };
                _local_3.events = _widgetEvents;
                if (!_local_3.init())
                {
                    _local_2.push(_local_3);
                };
            };
            removeWidgets(_local_2);
            initializeLocalizations();
            _widgetEvents.dispatchEvent(new CatalogWidgetEvent("WIDGETS_INITIALIZED"));
        }

        private function initializeLocalizations():void
        {
            var _local_1:_SafeStr_3303 = new LocalizationCatalogWidget(_window, _catalog);
            _SafeStr_4346.push(_local_1);
            _local_1.page = this;
            _local_1.events = _widgetEvents;
            _local_1.init();
        }

        private function removeWidgets(_arg_1:Array):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:int;
            if (((_arg_1 == null) || (_arg_1.length == 0)))
            {
                return;
            };
            for each (_local_3 in _SafeStr_4346)
            {
                if (_local_3.window != null)
                {
                    for each (_local_2 in _arg_1)
                    {
                        if (_local_2.window != null)
                        {
                            if (_local_2.window.getChildIndex(_local_3.window) >= 0)
                            {
                                if (_arg_1.indexOf(_local_3) < 0)
                                {
                                    _arg_1.push(_local_3);
                                };
                                break;
                            };
                        };
                    };
                };
            };
            for each (_local_2 in _arg_1)
            {
                if (_local_2.window != null)
                {
                    _window.removeChild(_local_2.window);
                    _local_2.window.dispose();
                };
                _local_4 = _SafeStr_4346.indexOf(_local_2);
                if (_local_4 >= 0)
                {
                    _SafeStr_4346.splice(_local_4, 1);
                };
                _local_2.dispose();
            };
        }

        public function dispatchWidgetEvent(_arg_1:Event):Boolean
        {
            if (_widgetEvents != null)
            {
                return (_widgetEvents.dispatchEvent(_arg_1));
            };
            return (false);
        }

        public function replaceOffers(_arg_1:Vector.<_SafeStr_3141>, _arg_2:Boolean=false):void
        {
            if (_arg_2)
            {
                for each (var _local_3:_SafeStr_3141 in _offers)
                {
                    _local_3.dispose();
                };
            };
            _offers = _arg_1;
        }

        public function updateLimitedItemsLeft(_arg_1:int, _arg_2:int):void
        {
            for each (var _local_3:_SafeStr_3141 in _offers)
            {
                if (_local_3.offerId == _arg_1)
                {
                    _local_3.product.uniqueLimitedItemsLeft = _arg_2;
                    _widgetEvents.dispatchEvent(new ProductOfferUpdatedEvent(_local_3));
                    return;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3229 = "_-a1p" (String#8259, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_4346 = "_-11n" (String#1019, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)
// _SafeStr_6491 = "_-kY" (String#10312, DoABC#4)
// _SafeStr_6492 = "_-h1f" (String#7631, DoABC#4)
// _SafeStr_6493 = "_-A1B" (String#12115, DoABC#4)
// _SafeStr_6494 = "_-12r" (String#11090, DoABC#4)
// _SafeStr_8361 = "_-C1" (String#23328, DoABC#4)


