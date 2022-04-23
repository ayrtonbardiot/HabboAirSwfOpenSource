// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.vault.VaultController

package com.sulake.habbo.catalog.vault
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import _-Fh._SafeStr_407;
    import _-Fh._SafeStr_546;
    import _-Fh._SafeStr_535;

    public class VaultController extends _SafeStr_20 implements ILinkEventTracker 
    {

        private var _communicationManager:_SafeStr_25;
        private var _localizationManager:_SafeStr_18;
        private var _sessionDataManager:ISessionDataManager;
        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3882:VaultView;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function VaultController(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communicationManager = _arg_1;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_407(onVaultStatusMessageEvent));
            addMessageEvent(new _SafeStr_546(onIncomeRewardStatusMessageEvent));
            addMessageEvent(new _SafeStr_535(onIncomeRewardClaimResponseMessageEvent));
            context.addLinkEventTracker(this);
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            if (!_communicationManager)
            {
                return;
            };
            _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(_arg_1));
        }

        private function onVaultStatusMessageEvent(_arg_1:_SafeStr_407):void
        {
            var _local_2:* = null;
            if (((_SafeStr_3882) && (!(_SafeStr_3882.disposed))))
            {
                _local_2 = _arg_1.getParser();
                _SafeStr_3882.onCreditVaultDataReceived(_local_2.isUnlocked, _local_2.totalBalance, _local_2.withdrawBalance);
            };
        }

        private function onIncomeRewardStatusMessageEvent(_arg_1:_SafeStr_546):void
        {
            var _local_2:* = null;
            if (((_SafeStr_3882) && (!(_SafeStr_3882.disposed))))
            {
                _local_2 = _arg_1.getParser();
                _SafeStr_3882.onIncomeRewardDataReceived(_local_2.data);
            };
        }

        private function onIncomeRewardClaimResponseMessageEvent(_arg_1:_SafeStr_535):void
        {
            var _local_2:* = null;
            if (((_SafeStr_3882) && (!(_SafeStr_3882.disposed))))
            {
                _local_2 = _arg_1.getParser();
                _SafeStr_3882.onIncomeRewardClaimResponse(_local_2.rewardCategory, _local_2.result);
            };
        }

        public function openCatalogue():void
        {
            context.createLinkEvent("catalog/open");
        }

        public function get linkPattern():String
        {
            return ("habboUI/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 3)
            {
                return;
            };
            if (_local_2[1] == "open")
            {
                switch (_local_2[2])
                {
                    case "vault":
                        showVault();
                        return;
                };
            };
        }

        public function withdrawVaultCredits():void
        {
            _sessionDataManager.withdrawCreditVault();
        }

        public function claimReward(_arg_1:int):void
        {
            _sessionDataManager.claimReward(_arg_1);
        }

        private function showVault():void
        {
            if (((!(_SafeStr_3882)) || (_SafeStr_3882.disposed)))
            {
                _SafeStr_3882 = new VaultView(this, _windowManager);
            };
            _sessionDataManager.getCreditVaultStatus();
            _sessionDataManager.getIncomeRewardStatus();
        }

        public function removeView():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        override public function dispose():void
        {
            if (((!(_messageEvents == null)) && (!(_communicationManager == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communicationManager.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            removeView();
            _messageEvents = null;
            super.dispose();
        }


    }
}//package com.sulake.habbo.catalog.vault

// _SafeStr_1193 = "_-r1x" (String#41001, DoABC#4)
// _SafeStr_1371 = "_-id" (String#32503, DoABC#4)
// _SafeStr_1454 = "_-Z1L" (String#35551, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_407 = "_-D1e" (String#28010, DoABC#4)
// _SafeStr_535 = "_-bL" (String#24104, DoABC#4)
// _SafeStr_546 = "_-oG" (String#23192, DoABC#4)


