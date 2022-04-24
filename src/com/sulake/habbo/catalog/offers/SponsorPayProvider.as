// by nota

//com.sulake.habbo.catalog.offers.SponsorPayProvider

package com.sulake.habbo.catalog.offers
{
    import flash.utils.Timer;
    import flash.external.ExternalInterface;
    import flash.events.TimerEvent;

    public class SponsorPayProvider implements IOfferProvider 
    {

        private static const LOADED_CALLBACK:String = "sponsorPayLoaded";
        private static const ON_START_CALLBACK:String = "sponsorPayOnStart";
        private static const NO_OFFERS_CALLBACK:String = "sponsorPayNoOffers";
        private static const ON_CLOSE_CALLBACK:String = "sponsorPayOnClose";
        private static const ON_CONVERSION_CALLBACK:String = "sponsorPayOnConversion";
        private static const _SafeStr_8319:String = "SponsorPay.loadIntegration";
        private static const SHOW_VIDEO_FUNCTION:String = "SponsorPay.showVideo";
        private static const BACKGROUND_LOAD_FUNCTION:String = "SponsorPay.backgroundLoad";
        private static const _SafeStr_8320:int = 150000;

        private var _disposed:Boolean;
        private var _offerCenter:OfferCenter;
        private var _loaded:Boolean;
        private var _SafeStr_6218:Boolean;
        private var _showingPopup:Boolean;
        private var _SafeStr_6217:Timer;

        public function SponsorPayProvider(_arg_1:OfferCenter):void
        {
            _offerCenter = _arg_1;
            if (!enabled)
            {
                return;
            };
            ExternalInterface.addCallback("sponsorPayLoaded", sponsorPayLoaded);
            ExternalInterface.addCallback("sponsorPayOnStart", sponsorPayOnStart);
            ExternalInterface.addCallback("sponsorPayNoOffers", sponsorPayNoOffers);
            ExternalInterface.addCallback("sponsorPayOnClose", sponsorPayOnClose);
            ExternalInterface.addCallback("sponsorPayOnConversion", sponsorPayOnConversion);
            _SafeStr_6217 = new Timer(150000, 1);
            _SafeStr_6217.addEventListener("timer", onResetTimer);
        }

        private function onResetTimer(_arg_1:TimerEvent):void
        {
            sponsorPayOnClose();
        }

        public function load():void
        {
            if (_loaded)
            {
                sponsorPayLoaded();
                return;
            };
            if (enabled)
            {
                try
                {
                    ExternalInterface.call("SponsorPay.loadIntegration", appId);
                    _loaded = true;
                }
                catch(e:Error)
                {
                    _SafeStr_14.log(("External interface not working. Could not call SponsorPay.loadIntegration: " + e));
                };
            };
        }

        private function get appId():String
        {
            return (_offerCenter.configuration.getProperty("offers.sponsorpay.appid"));
        }

        public function showVideo():void
        {
            if (((_loaded) && (enabled)))
            {
                try
                {
                    ExternalInterface.call("SponsorPay.showVideo");
                    _showingPopup = true;
                    _SafeStr_6217.reset();
                    _SafeStr_6217.start();
                    updateVideoStatus();
                }
                catch(e:Error)
                {
                    _SafeStr_14.log(("External interface not working. Could not call SponsorPay.showVideo: " + e));
                };
            };
        }

        public function sponsorPayLoaded():void
        {
            if (_showingPopup)
            {
                return;
            };
            _SafeStr_6218 = false;
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("SponsorPay.backgroundLoad");
                }
                else
                {
                    _SafeStr_14.log("External interface not available. Could not call SponsorPay.backgroundLoad.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("External interface not working. Could not call SponsorPay.backgroundLoad: " + e));
            };
        }

        public function sponsorPayOnStart(_arg_1:String):void
        {
            _SafeStr_6218 = true;
            updateVideoStatus();
        }

        public function sponsorPayNoOffers():void
        {
            _SafeStr_6218 = false;
            updateVideoStatus();
        }

        public function sponsorPayOnClose():void
        {
            _showingPopup = false;
            if (_SafeStr_6217)
            {
                _SafeStr_6217.stop();
            };
            var _local_1:int;
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("SponsorPay.backgroundLoad");
                }
                else
                {
                    _SafeStr_14.log("External interface not available. Could not call SponsorPay.backgroundLoad.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("External interface not working. Could not call SponsorPay.backgroundLoad: " + e));
            }
            finally
            {
                updateVideoStatus();
            };
        }

        public function sponsorPayOnConversion():void
        {
            if (_offerCenter != null)
            {
                _offerCenter.showSuccess();
            };
        }

        private function updateVideoStatus():void
        {
            if (_offerCenter != null)
            {
                _offerCenter.updateVideoStatus();
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("sponsorPayLoaded", null);
                ExternalInterface.addCallback("sponsorPayOnStart", null);
                ExternalInterface.addCallback("sponsorPayNoOffers", null);
                ExternalInterface.addCallback("sponsorPayOnClose", null);
                ExternalInterface.addCallback("sponsorPayOnConversion", null);
            };
            if (_SafeStr_6217 != null)
            {
                _SafeStr_6217.removeEventListener("timer", onResetTimer);
                _SafeStr_6217.stop();
                _SafeStr_6217 = null;
            };
            _offerCenter = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get videoAvailable():Boolean
        {
            return (_SafeStr_6218);
        }

        public function get showingPopup():Boolean
        {
            return (_showingPopup);
        }

        public function get enabled():Boolean
        {
            return ((!(appId == "")) && (ExternalInterface.available));
        }


    }
}//package com.sulake.habbo.catalog.offers

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_6217 = "_-96" (String#5714, DoABC#4)
// _SafeStr_6218 = "_-j1z" (String#9371, DoABC#4)
// _SafeStr_8319 = "_-m1j" (String#36441, DoABC#4)
// _SafeStr_8320 = "_-g1w" (String#38239, DoABC#4)


