// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubExtendController

package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import _-AE._SafeStr_1541;
    import _-g1G._SafeStr_1223;
    import _-qv._SafeStr_895;
    import _-AE._SafeStr_739;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime._SafeStr_19;

    public class ClubExtendController 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_3842:ClubExtendConfirmationDialog;
        private var _offer:_SafeStr_1541;
        private var _disposed:Boolean = false;

        public function ClubExtendController(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            closeConfirmation();
            _offer = null;
            _catalog = null;
            _disposed = true;
        }

        public function onOffer(_arg_1:_SafeStr_739):void
        {
            if (_disposed)
            {
                return;
            };
            var _local_2:_SafeStr_1223 = _arg_1.getParser();
            _offer = _local_2.offer();
            showConfirmation();
            if (_catalog.connection)
            {
                if (_offer.vip)
                {
                    _catalog.connection.send(new _SafeStr_895("Catalog", "dialog_show", "vip.membership.extension.purchase"));
                }
                else
                {
                    _catalog.connection.send(new _SafeStr_895("Catalog", "dialog_show", "basic.membership.extension.purchase"));
                };
            };
        }

        public function closeConfirmation():void
        {
            if (_SafeStr_3842)
            {
                _SafeStr_3842.dispose();
                _SafeStr_3842 = null;
            };
        }

        public function showConfirmation():void
        {
            closeConfirmation();
            _SafeStr_3842 = new ClubExtendConfirmationDialog(this, _offer);
            _SafeStr_3842.showConfirmation();
        }

        public function confirmSelection():void
        {
            if ((((!(_catalog)) || (!(_catalog.connection))) || (!(_offer))))
            {
                return;
            };
            if (_catalog.getPurse().credits < _offer.priceCredits)
            {
                _catalog.showNotEnoughCreditsAlert();
                return;
            };
            if (_offer.vip)
            {
                _catalog.purchaseVipMembershipExtension(_offer.offerId);
            }
            else
            {
                _catalog.purchaseBasicMembershipExtension(_offer.offerId);
            };
            closeConfirmation();
        }

        public function get windowManager():_SafeStr_1695
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.windowManager);
        }

        public function get localization():_SafeStr_18
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.localization);
        }

        public function get assets():_SafeStr_21
        {
            if (!_catalog)
            {
                return (null);
            };
            return (_catalog.assets);
        }

        public function get config():_SafeStr_19
        {
            return (_catalog);
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_1223 = "_-91H" (String#33106, DoABC#4)
// _SafeStr_1541 = "_-51r" (String#23471, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3842 = "_-413" (String#1546, DoABC#4)
// _SafeStr_739 = "_-Zv" (String#19251, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


