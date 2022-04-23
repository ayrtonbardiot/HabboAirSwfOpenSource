// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.vault.VaultView

package com.sulake.habbo.catalog.vault
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.habbo.window._SafeStr_1695;
    import _-613._SafeStr_1605;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class VaultView implements _SafeStr_13 
    {

        private static const TAB_EARNINGS:String = "earningsTab";
        private static const TAB_VAULT:String = "vaultTab";

        private const DEFAULT_VIEW_LOCATION:Point = new Point(120, 150);

        private var _SafeStr_4360:VaultController;
        private var _window:_SafeStr_3133;
        private var _currentTab:String = "earningsTab";
        private var _tabContext:ITabContextWindow;
        private var _SafeStr_5943:Array = ["tutorial", "dailygift", "achievements", "marketplace", "habboclub", "levelprogression", "roombundlesales", "bonusbag", "donation", "surprise", "snowstorm"];

        public function VaultView(_arg_1:VaultController, _arg_2:_SafeStr_1695)
        {
            _SafeStr_4360 = _arg_1;
            _window = (_arg_2.buildFromXML(XML(_SafeStr_4360.assets.getAssetByName("vault_view_xml").content)) as _SafeStr_3133);
            _window.position = DEFAULT_VIEW_LOCATION;
            _window.procedure = windowProcedure;
            _window.findChildByName("vaultTab").procedure = onTab;
            _window.findChildByName("earningsTab").procedure = onTab;
            refresh();
            switchToTab("earningsTab");
        }

        private static function getDistinctRewardCategories(_arg_1:Array):Array
        {
            var _local_2:Boolean;
            var _local_4:Array = [];
            for each (var _local_3:_SafeStr_1605 in _arg_1)
            {
                _local_2 = false;
                for each (var _local_5:int in _local_4)
                {
                    if (_local_3.rewardCategory == _local_5)
                    {
                        _local_2 = true;
                        break;
                    };
                };
                if (!_local_2)
                {
                    _local_4.push(_local_3.rewardCategory);
                };
            };
            return (_local_4);
        }


        private function resizeTabs():void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:int = int((_window.width / _tabContext.numTabItems));
            _local_1 = (_local_1 - 1);
            _local_3 = 0;
            while (_local_3 < _tabContext.numTabItems)
            {
                _local_2 = _tabContext.getTabItemAt(_local_3);
                _local_2.width = (_local_1 - 2);
                _local_3++;
            };
        }

        private function switchToTab(_arg_1:String):void
        {
            _currentTab = _arg_1;
            _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(_currentTab)));
        }

        public function onCreditVaultDataReceived(_arg_1:Boolean, _arg_2:int, _arg_3:int):void
        {
            if (_arg_1)
            {
                toggleUnlockedVaultElements(true, _arg_2);
                toggleLockedVaultElements(false, _arg_2, _arg_3);
            }
            else
            {
                toggleUnlockedVaultElements(false, _arg_2);
                toggleLockedVaultElements(true, _arg_2, _arg_3);
            };
        }

        private function toggleUnlockedVaultElements(_arg_1:Boolean, _arg_2:int):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            if (_window)
            {
                _local_5 = ["vaultUnlockedInstructions_container"];
                for each (var _local_6:String in _local_5)
                {
                    _local_4 = _window.findChildByName(_local_6);
                    if (_local_4 != null)
                    {
                        _local_4.visible = _arg_1;
                    };
                };
                _local_3 = _window.findChildByName("vaultCreditsPending_amount");
                if (_local_3 != null)
                {
                    _local_3.caption = _arg_2.toString();
                };
                _local_7 = _window.findChildByName("vaultWithdrawAll_button");
                if (_local_7 != null)
                {
                    if (_arg_2 > 0)
                    {
                        _local_7.enable();
                    }
                    else
                    {
                        _local_7.disable();
                    };
                };
            };
        }

        private function toggleLockedVaultElements(_arg_1:Boolean, _arg_2:int, _arg_3:int):void
        {
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_9:* = null;
            var _local_4:* = null;
            if (_window)
            {
                _local_6 = ["vaultWithdrawArea", "vaultLockedInstructions_container"];
                for each (var _local_8:String in _local_6)
                {
                    _local_5 = _window.findChildByName(_local_8);
                    if (_local_5 != null)
                    {
                        _local_5.visible = _arg_1;
                    };
                };
                if (_arg_1)
                {
                    _local_7 = _window.findChildByName("vaultCredits_amount");
                    if (_local_7 != null)
                    {
                        _local_7.caption = _arg_3.toString();
                        _local_9 = _window.findChildByName("vaultWithdraw_button");
                        if (_local_9 != null)
                        {
                            if (_arg_3 > 0)
                            {
                                _local_9.enable();
                            }
                            else
                            {
                                _local_9.disable();
                            };
                        };
                    };
                };
                _local_4 = _window.findChildByName("vaultCreditsPending_amount");
                if (_local_4 != null)
                {
                    _local_4.caption = _arg_2.toString();
                };
            };
        }

        public function onIncomeRewardClaimResponse(_arg_1:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                updateRewardsForCategory(_arg_1, 0, 0);
            }
            else
            {
                setElementEnabled((_SafeStr_5943[_arg_1] + "_claim_button"), true);
            };
        }

        public function onIncomeRewardDataReceived(_arg_1:Array):void
        {
            var _local_6:int;
            var _local_3:int;
            var _local_7:int;
            var _local_4:Boolean;
            var _local_10:* = null;
            var _local_5:Array = [];
            for each (var _local_2:int in getDistinctRewardCategories(_arg_1))
            {
                _local_6 = 0;
                _local_3 = 0;
                _local_7 = 0;
                for each (var _local_8:_SafeStr_1605 in _arg_1)
                {
                    if (_local_2 == _local_8.rewardCategory)
                    {
                        if (_local_8.rewardType == 0)
                        {
                            _local_6 = (_local_6 + _local_8.amount);
                        };
                        if (_local_8.rewardType === 1)
                        {
                            _local_3 = (_local_3 + _local_8.amount);
                        };
                        if (_local_8.productCode)
                        {
                            _local_7++;
                        };
                    };
                };
                updateRewardsForCategory(_local_2, _local_3, _local_6, _local_7);
                if ((((_local_3 > 0) || (_local_6 > 0)) || (_local_7 > 0)))
                {
                    _local_5.push(_SafeStr_5943[_local_2]);
                };
            };
            for each (var _local_9:String in _SafeStr_5943)
            {
                _local_4 = false;
                for each (var _local_11:String in _local_5)
                {
                    if (_local_9 == _local_11)
                    {
                        _local_4 = true;
                        break;
                    };
                };
                if (!_local_4)
                {
                    _local_10 = _window.findChildByName((_local_9 + "_claim_button"));
                    if (_local_10 != null)
                    {
                        _local_10.disable();
                    };
                };
            };
        }

        private function updateRewardsForCategory(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):void
        {
            var _local_6:* = null;
            var _local_8:String = _SafeStr_5943[_arg_1];
            var _local_7:_SafeStr_3109 = _window.findChildByName((_local_8 + "CreditValue"));
            if (_local_7 != null)
            {
                _local_7.caption = _arg_2.toString();
            };
            var _local_5:_SafeStr_3109 = _window.findChildByName((_local_8 + "DucketValue"));
            if (_local_5 != null)
            {
                _local_5.caption = _arg_3.toString();
            };
            if (_arg_4 > 0)
            {
                _local_6 = _window.findChildByName((_local_8 + "ProductValue"));
                if (_local_6 != null)
                {
                    _local_6.caption = _arg_4.toString();
                };
            };
        }

        private function onTab(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _currentTab = _arg_2.name;
            refresh();
        }

        private function refresh():void
        {
            _tabContext = ITabContextWindow(_window.findChildByName("tabs"));
            _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(_currentTab)));
            resizeTabs();
            if (_currentTab == "vaultTab")
            {
                _window.findChildByName("vaultContentArea").visible = true;
                _window.findChildByName("earningsContentArea").visible = false;
            }
            else
            {
                if (_currentTab == "earningsTab")
                {
                    _window.findChildByName("vaultContentArea").visible = false;
                    _window.findChildByName("earningsContentArea").visible = true;
                };
            };
        }

        private function setElementEnabled(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_3 != null)
            {
                ((_arg_2) ? _local_3.enable() : _local_3.disable());
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "vaultWithdraw_button":
                case "vaultWithdrawAll_button":
                    _SafeStr_4360.withdrawVaultCredits();
                    return;
                case "vaultOpenShop_button":
                    _SafeStr_4360.openCatalogue();
                    return;
                case "header_button_close":
                    dispose();
                    return;
                case "dailygift_claim_button":
                    setElementEnabled("dailygift_claim_button", false);
                    _SafeStr_4360.claimReward(1);
                    return;
                case "achievements_claim_button":
                    setElementEnabled("achievements_claim_button", false);
                    _SafeStr_4360.claimReward(2);
                    return;
                case "marketplace_claim_button":
                    setElementEnabled("marketplace_claim_button", false);
                    _SafeStr_4360.claimReward(3);
                    return;
                case "habboclub_claim_button":
                    setElementEnabled("habboclub_claim_button", false);
                    _SafeStr_4360.claimReward(4);
                    return;
                case "levelprogression_claim_button":
                    setElementEnabled("levelprogression_claim_button", false);
                    _SafeStr_4360.claimReward(5);
                    return;
                case "bonusbag_claim_button":
                    setElementEnabled("bonusbag_claim_button", false);
                    _SafeStr_4360.claimReward(7);
                    return;
                case "donation_claim_button":
                    setElementEnabled("donation_claim_button", false);
                    _SafeStr_4360.claimReward(8);
                    return;
                case "surprise_claim_button":
                    setElementEnabled("surprise_claim_button", false);
                    _SafeStr_4360.claimReward(9);
                    return;
                case "snowstorm_claim_button":
                    setElementEnabled("snowstorm_claim_button", false);
                    _SafeStr_4360.claimReward(10);
                    return;
            };
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4360 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4360 == null);
        }


    }
}//package com.sulake.habbo.catalog.vault

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1605 = "_-61K" (String#31127, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5943 = "_-U5" (String#10774, DoABC#4)


