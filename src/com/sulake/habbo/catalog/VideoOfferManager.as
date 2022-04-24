// by nota

//com.sulake.habbo.catalog.VideoOfferManager

package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import _-yL._SafeStr_142;
    import flash.external.ExternalInterface;
    import _-qv._SafeStr_895;
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;

    public class VideoOfferManager implements IVideoOfferManager, _SafeStr_13 
    {

        private static const CAMPAIGN_READY_CALLBACK:String = "supersaverAdsOnCampaignsReady";
        private static const CAMPAIGN_COMPLETE_CALLBACK:String = "supersaverAdsOnCampaignCompleted";
        private static const CAMPAIGN_OPEN_CALLBACK:String = "supersaverAdsOnCampaignOpen";
        private static const CAMPAIGN_CLOSE_CALLBACK:String = "supersaverAdsOnCampaignClose";
        private static const _SafeStr_8321:String = "supersaverAdsLoadCampaigns";
        private static const _SafeStr_8322:String = "supersaverAdsCamapaignEngage";

        private var _disposed:Boolean;
        private var _catalog:HabboCatalog;
        private var _SafeStr_4630:Boolean;
        private var _offersAvailable:int;
        private var _offersViewed:int = 0;
        private var _offersRequested:Boolean;
        private var _offersReceived:Boolean;
        private var _launchers:Vector.<IVideoOfferLauncher>;
        private var _callbacksAdded:Boolean;

        public function VideoOfferManager(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
            _launchers = new Vector.<IVideoOfferLauncher>();
            _SafeStr_4630 = false;
            _catalog.connection.addMessageEvent(new _SafeStr_142(onUserRights));
            addCallbacks();
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get enabled():Boolean
        {
            return (_SafeStr_4630);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _catalog = null;
            _launchers = null;
            _SafeStr_4630 = false;
            if (((_callbacksAdded) && (ExternalInterface.available)))
            {
                ExternalInterface.addCallback("supersaverAdsOnCampaignsReady", null);
                ExternalInterface.addCallback("supersaverAdsOnCampaignCompleted", null);
                ExternalInterface.addCallback("supersaverAdsOnCampaignOpen", null);
                ExternalInterface.addCallback("supersaverAdsOnCampaignClose", null);
                _callbacksAdded = false;
            };
            _disposed = true;
        }

        private function addCallbacks():void
        {
            if ((((_SafeStr_4630) && (!(_callbacksAdded))) && (ExternalInterface.available)))
            {
                ExternalInterface.addCallback("supersaverAdsOnCampaignsReady", onCampaignsReady);
                ExternalInterface.addCallback("supersaverAdsOnCampaignCompleted", onCampaignComplete);
                ExternalInterface.addCallback("supersaverAdsOnCampaignOpen", onCampaignOpen);
                ExternalInterface.addCallback("supersaverAdsOnCampaignClose", onCampaignClose);
                _callbacksAdded = true;
            };
        }

        private function onUserRights(_arg_1:_SafeStr_142):void
        {
            if (_arg_1.securityLevel >= 1)
            {
                _SafeStr_4630 = false;
                addCallbacks();
            };
        }

        public function load(_arg_1:IVideoOfferLauncher):void
        {
            if (!_SafeStr_4630)
            {
                return;
            };
            if (((_offersRequested) && (_offersReceived)))
            {
                _arg_1.offersAvailable(_offersAvailable);
            }
            else
            {
                if (((!(_offersRequested)) && (ExternalInterface.available)))
                {
                    ExternalInterface.call("supersaverAdsLoadCampaigns");
                    _offersRequested = true;
                };
                _launchers.push(_arg_1);
            };
        }

        public function launch(_arg_1:VideoOfferTypeEnum):Boolean
        {
            if (((!(_SafeStr_4630)) || (_offersAvailable < 1)))
            {
                return (false);
            };
            if (ExternalInterface.available)
            {
                _offersViewed = (_offersViewed + 1);
                ExternalInterface.call("supersaverAdsCamapaignEngage");
                turnVolumeDown();
                if (_catalog.connection)
                {
                    _catalog.connection.send(new _SafeStr_895("SuperSaverAds", "client_action", "supersaverads.video.promo.launched"));
                };
                return (_offersAvailable > _offersViewed);
            };
            return (false);
        }

        public function onCampaignsReady(_arg_1:String):void
        {
            _offersReceived = true;
            _offersAvailable = parseInt(_arg_1);
            if (isNaN(_offersAvailable))
            {
                _offersAvailable = 0;
            };
            while (_launchers.length > 0)
            {
                _launchers.pop().offersAvailable(_offersAvailable);
            };
        }

        public function onCampaignOpen():void
        {
        }

        public function onCampaignClose():void
        {
            turnVolumeUp();
            if (_catalog.connection)
            {
                _catalog.connection.send(new _SafeStr_895("SuperSaverAds", "client_action", "supersaverads.video.promo.close"));
            };
        }

        public function onCampaignComplete():void
        {
            turnVolumeUp();
            if (_catalog.connection)
            {
                _catalog.connection.send(new _SafeStr_895("SuperSaverAds", "client_action", "supersaverads.video.promo.complete"));
            };
        }

        private function turnVolumeDown():void
        {
            if (_catalog.soundManager)
            {
                _catalog.soundManager.mute(true);
            };
        }

        private function turnVolumeUp():void
        {
            if (_catalog.soundManager)
            {
                _catalog.soundManager.mute(false);
            };
        }


    }
}//package com.sulake.habbo.catalog

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_4630 = "_-q1w" (String#3476, DoABC#4)
// _SafeStr_8321 = "_-OK" (String#31502, DoABC#4)
// _SafeStr_8322 = "_-EA" (String#29873, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


