// by nota

//com.sulake.habbo.catalog.IHabboCatalog

package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window._SafeStr_1695;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.catalog.navigation._SafeStr_3107;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.catalog.offers.IOfferCenter;

    public /*dynamic*/ interface IHabboCatalog extends IUnknown 
    {

        function redeemVoucher(_arg_1:String):void;
        function loadCatalogPage(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function get assets():IAssetLibrary;
        function get windowManager():_SafeStr_1695;
        function get events():IEventDispatcher;
        function get localization():_SafeStr_18;
        function get connection():IConnection;
        function get navigator():_SafeStr_1696;
        function get videoOffers():IVideoOfferManager;
        function toggleCatalog(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void;
        function openCatalog():void;
        function openCatalogPage(_arg_1:String, _arg_2:String=null):void;
        function openRoomAdCatalogPageInExtendedMode(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void;
        function openCatalogPageById(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function openCatalogPageByOfferId(_arg_1:int, _arg_2:String):void;
        function openInventoryCategory(_arg_1:String):void;
        function openCreditsHabblet():void;
        function get privateRoomSessionActive():Boolean;
        function get tradingActive():Boolean;
        function getProductData(_arg_1:String):_SafeStr_3182;
        function getFurnitureData(_arg_1:int, _arg_2:String):_SafeStr_3130;
        function getPixelEffectIcon(_arg_1:int):BitmapData;
        function getSubscriptionProductIcon(_arg_1:int):BitmapData;
        function getPurse():_SafeStr_3142;
        function getMarketPlace():IMarketPlace;
        function getPublicMarketPlaceOffers(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function getOwnMarketPlaceOffers():void;
        function buyMarketPlaceOffer(_arg_1:int):void;
        function redeemSoldMarketPlaceOffers():void;
        function redeemExpiredMarketPlaceOffer(_arg_1:int):void;
        function getMarketplaceItemStats(_arg_1:int, _arg_2:int):void;
        function showNotEnoughCreditsAlert():void;
        function showNotEnoughActivityPointsAlert(_arg_1:int):void;
        function getHabboClubOffers(_arg_1:int):void;
        function openClubCenter():void;
        function openVault():void;
        function verifyClubLevel(_arg_1:int=1):Boolean;
        function set giftReceiver(_arg_1:String):void;
        function buySnowWarTokensOffer(_arg_1:String):void;
        function get imageGalleryHost():String;
        function showVipBenefits():void;
        function displayProductIcon(_arg_1:String, _arg_2:int, _arg_3:_SafeStr_3264):void;
        function openRentConfirmationWindow(_arg_1:_SafeStr_3130, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;
        function get buildersClubEnabled():Boolean;
        function toggleBuilderCatalog():void;
        function get catalogType():String;
        function getCatalogNavigator(_arg_1:String):_SafeStr_3107;
        function get isDoorModeOverriddenInCurrentRoom():Boolean;
        function getOfferCenter(_arg_1:IOfferExtension):IOfferCenter;

    }
}//package com.sulake.habbo.catalog

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3107 = "_-Bx" (String#5257, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)


