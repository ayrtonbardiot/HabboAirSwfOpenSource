// by nota

//com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import _-n1H._SafeStr_1553;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import _-o1x._SafeStr_1025;
    import flash.events.Event;
    import _-n1H._SafeStr_1628;
    import _-n1H._SafeStr_1639;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ISelectorWindow;
    import _-Ja._SafeStr_1629;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-o1x._SafeStr_1363;
    import _-o1x._SafeStr_433;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import _-o1x._SafeStr_811;
    import flash.utils.Dictionary;
    import _-o1x._SafeStr_824;
    import com.sulake.core.window.components.IItemListWindow;
    import _-o1x._SafeStr_943;
    import _-n1H._SafeStr_1627;
    import _-p1Y._SafeStr_767;
    import _-p1Y._SafeStr_935;
    import com.sulake.habbo.navigator.*;

    public class RoomSettingsCtrl implements _SafeStr_13, ILinkEventTracker 
    {

        private static const TAB_BASIC:int = 1;
        private static const TAB_ACCESS_RIGHTS:int = 2;
        private static const TAB_ROOM_RIGHTS:int = 3;
        private static const TAB_CLUB_AND_CHAT:int = 4;
        private static const TAB_MODERATION:int = 5;
        private static const HC_MAXIMUM_ROOM_VISITORS:int = 75;
        private static const MAXIMUM_ROOM_VISITORS:int = 50;

        private var _flatId:int;
        private var _groupId:int;
        private var _navigator:_SafeStr_1697;
        private var _originalData:_SafeStr_1553;
        private var _savedFlatId:int;
        private var _window:_SafeStr_3263;
        private var _currentTab:int = 1;
        private var _populating:Boolean;
        private var _usersWithRightsListCtrl:UserListCtrl;
        private var _friendsListCtrl:UserListCtrl;
        private var _confirmDialog:ConfirmDialogView;
        private var _nameInput:TextFieldManager;
        private var _descInput:TextFieldManager;
        private var _tag1Input:TextFieldManager;
        private var _tag2Input:TextFieldManager;
        private var _passwordInput:TextFieldManager;
        private var _passwordConfirmInput:TextFieldManager;
        private var _allowPetsCheckBox:_SafeStr_3158;
        private var _allowFoodConsumeCheckBox:_SafeStr_3158;
        private var _allowWalkThroughCheckBox:_SafeStr_3158;
        private var _allowDynCatsCheckBox:_SafeStr_3158;
        private var _hideWallsCheckBox:_SafeStr_3158;
        private var _hideWallsText:ITextWindow;
        private var _wallThicknessDropMenu:_SafeStr_3269;
        private var _floorThicknessDropMenu:_SafeStr_3269;
        private var _tabContext:ITabContextWindow;
        private var _chatModeDropMenu:_SafeStr_3269;
        private var _chatBubbleWidthDropMenu:_SafeStr_3269;
        private var _chatScrollSpeedDropMenu:_SafeStr_3269;
        private var _floodFilterDropMenu:_SafeStr_3269;
        private var _chatSettingsTitleText:ITextWindow;
        private var _chatSettingsInfoText:ITextWindow;
        private var _chatFullHearRangeInput:TextFieldManager;
        private var _chatFullHearRangeTextField:ITextFieldWindow;
        private var _bannedUsersListCtrl:BanListCtrl;
        private var _useUnifiedWindow:Boolean;
        private var _removeTabsForNavigatorView:Boolean = false;
        private var roomModerationMuteSettings:Array;
        private var roomModerationBanSettings:Array;
        private var roomModerationKickSettings:Array;

        public function RoomSettingsCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
            _usersWithRightsListCtrl = new UserListCtrl(_navigator, false);
            _friendsListCtrl = new UserListCtrl(_navigator, true);
            _bannedUsersListCtrl = new BanListCtrl(_navigator);
        }

        private static function get useHashTags():Boolean
        {
            return (true);
        }

        private static function setTag(_arg_1:TextFieldManager, _arg_2:String):void
        {
            _arg_1.setText(((_arg_2 == null) ? "" : (((useHashTags) ? "#" : "") + _arg_2)));
        }


        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _originalData = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_usersWithRightsListCtrl)
            {
                _usersWithRightsListCtrl.dispose();
                _usersWithRightsListCtrl = null;
            };
            if (_friendsListCtrl)
            {
                _friendsListCtrl.dispose();
                _friendsListCtrl = null;
            };
            if (_bannedUsersListCtrl)
            {
                _bannedUsersListCtrl.dispose();
                _bannedUsersListCtrl = null;
            };
            if (_confirmDialog)
            {
                _confirmDialog.dispose();
                _confirmDialog = null;
            };
            _nameInput = null;
            _descInput = null;
            _tag1Input = null;
            _tag2Input = null;
            _passwordInput = null;
            _passwordConfirmInput = null;
            _allowPetsCheckBox = null;
            _allowFoodConsumeCheckBox = null;
            if (_allowWalkThroughCheckBox)
            {
                _allowWalkThroughCheckBox.removeEventListener("WME_OVER", onWalkThroughMouseOver);
                _allowWalkThroughCheckBox = null;
            };
            if (_chatBubbleWidthDropMenu)
            {
                _chatBubbleWidthDropMenu.removeEventListener("WME_OVER", onBubbleWidthMouseOver);
                _chatBubbleWidthDropMenu = null;
            };
            if (_floodFilterDropMenu)
            {
                _floodFilterDropMenu.removeEventListener("WME_OVER", onFloodFilterMouseOver);
                _floodFilterDropMenu = null;
            };
            if (_chatFullHearRangeTextField)
            {
                _chatFullHearRangeTextField.removeEventListener("WME_OVER", onFullHearRangeMouseOver);
                _chatFullHearRangeTextField = null;
            };
            _allowDynCatsCheckBox = null;
            _hideWallsCheckBox = null;
            _hideWallsText = null;
            _wallThicknessDropMenu = null;
            _floorThicknessDropMenu = null;
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function startRoomSettingsEdit(_arg_1:int):void
        {
            close();
            this._flatId = _arg_1;
            this._groupId = _navigator.data.enteredGuestRoom.habboGroupId;
            _navigator.send(new _SafeStr_1025(_flatId));
            _navigator.tracking.trackEventLogOncePerSession("Tutorial", "interaction", "viewed.room.settings");
            _navigator.events.dispatchEvent(new Event("HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT"));
        }

        public function startRoomSettingsEditFromNavigator(_arg_1:int, _arg_2:int):void
        {
            close();
            this._flatId = _arg_1;
            this._groupId = _arg_2;
            _navigator.send(new _SafeStr_1025(_flatId));
            _navigator.tracking.trackEventLogOncePerSession("Tutorial", "interaction", "viewed.room.settings");
            _navigator.events.dispatchEvent(new Event("HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT"));
        }

        public function onRoomSettings(_arg_1:_SafeStr_1553):void
        {
            if (_arg_1.roomId != this._flatId)
            {
                return;
            };
            _originalData = _arg_1;
            refresh();
            populateForm();
            _window.visible = true;
            _window.invalidate();
            _window.activate();
        }

        public function onFlatControllers(_arg_1:int, _arg_2:Array):void
        {
            if (isAcceptFlatControllerUpdate(_arg_1))
            {
                for each (var _local_3:_SafeStr_1628 in _arg_2)
                {
                    _originalData.setFlatController(_local_3.userId, _local_3);
                };
                checkFlatControllerRefresh();
            };
        }

        public function onFlatControllerAdded(_arg_1:int, _arg_2:_SafeStr_1628):void
        {
            if (isAcceptFlatControllerUpdate(_arg_1))
            {
                _originalData.setFlatController(_arg_2.userId, _arg_2);
                checkFlatControllerRefresh();
            };
        }

        public function onFlatControllerRemoved(_arg_1:int, _arg_2:int):void
        {
            if (isAcceptFlatControllerUpdate(_arg_1))
            {
                _originalData.setFlatController(_arg_2, null);
                checkFlatControllerRefresh();
            };
        }

        public function onBannedUsersFromRoom(_arg_1:int, _arg_2:Array):void
        {
            if (isAcceptBannedUsersFromRoomUpdate(_arg_1))
            {
                for each (var _local_3:_SafeStr_1639 in _arg_2)
                {
                    _originalData.setBannedUser(_local_3.userId, _local_3);
                };
                checkBannedUsersFromRoomRefresh();
            };
        }

        public function onUserUnbannedFromRoom(_arg_1:int, _arg_2:int):void
        {
            if (isAcceptBannedUsersFromRoomUpdate(_arg_1))
            {
                _originalData.setBannedUser(_arg_2, null);
                checkBannedUsersFromRoomRefresh();
            };
        }

        public function onFriendListUpdate():void
        {
            checkFlatControllerRefresh();
        }

        private function isAcceptFlatControllerUpdate(_arg_1:int):Boolean
        {
            return ((_arg_1 == this._flatId) && (!(_originalData == null)));
        }

        private function isAcceptBannedUsersFromRoomUpdate(_arg_1:int):Boolean
        {
            return ((_arg_1 == this._flatId) && (!(_originalData == null)));
        }

        private function checkFlatControllerRefresh():void
        {
            if ((((!(_window == null)) && (_window.visible)) && (isContentVisible(3))))
            {
                refresh();
            };
        }

        private function checkBannedUsersFromRoomRefresh():void
        {
            if ((((!(_window == null)) && (_window.visible)) && (isContentVisible(5))))
            {
                refresh();
            };
        }

        public function onRoomSettingsSaveError(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            if (((!(_arg_1 == this._flatId)) || (_savedFlatId < 1)))
            {
                return;
            };
            _savedFlatId = 0;
            if (_arg_2 == 7)
            {
                switchToTab(1);
                this._nameInput.displayError("${navigator.roomsettings.roomnameismandatory}");
            }
            else
            {
                if (_arg_2 == 8)
                {
                    switchToTab(1);
                    this._nameInput.displayError("${navigator.roomsettings.unacceptablewords}");
                }
                else
                {
                    if (_arg_2 == 10)
                    {
                        switchToTab(1);
                        this._descInput.displayError("${navigator.roomsettings.unacceptablewords}");
                    }
                    else
                    {
                        if (_arg_2 == 11)
                        {
                            switchToTab(1);
                            setTagError(this._tag1Input, _arg_3, "${navigator.roomsettings.unacceptablewords}");
                            setTagError(this._tag2Input, _arg_3, "${navigator.roomsettings.unacceptablewords}");
                        }
                        else
                        {
                            if (_arg_2 == 12)
                            {
                                switchToTab(1);
                                setTagError(this._tag1Input, _arg_3, "${navigator.roomsettings.nonuserchoosabletag}");
                                setTagError(this._tag2Input, _arg_3, "${navigator.roomsettings.nonuserchoosabletag}");
                            }
                            else
                            {
                                if (_arg_2 == 5)
                                {
                                    switchToTab(2);
                                    this._passwordInput.displayError("${navigator.roomsettings.passwordismandatory}");
                                }
                                else
                                {
                                    if (_arg_2 == 13)
                                    {
                                        switchToTab(1);
                                        setTagError(this._tag1Input, _arg_3, "${navigator.roomsettings.toomanycharacters}");
                                        setTagError(this._tag2Input, _arg_3, "${navigator.roomsettings.toomanycharacters}");
                                    }
                                    else
                                    {
                                        switchToTab(1);
                                        this._nameInput.displayError(("Update failed: error " + _arg_2));
                                    };
                                };
                            };
                        };
                    };
                };
            };
            refresh();
        }

        private function switchToTab(_arg_1:int):void
        {
            _currentTab = _arg_1;
            _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(("tab_" + _arg_1))));
            _window.helpPage = getHelpPageWithTab(_currentTab);
        }

        private function isContentVisible(_arg_1:int):Boolean
        {
            return ((_useUnifiedWindow) || (_currentTab == _arg_1));
        }

        private function setTagError(_arg_1:TextFieldManager, _arg_2:String, _arg_3:String):void
        {
            if (_arg_2 == _arg_1.getText().toLowerCase())
            {
                _arg_1.displayError(_arg_3);
            };
        }

        public function close():void
        {
            this._flatId = 0;
            this._groupId = 0;
            this._originalData = null;
            this._savedFlatId = 0;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_confirmDialog != null)
            {
                _confirmDialog.dispose();
                _confirmDialog = null;
            };
        }

        private function clearErrors():void
        {
            this._nameInput.clearErrors();
            this._descInput.clearErrors();
            this._tag1Input.clearErrors();
            this._tag2Input.clearErrors();
            this._passwordInput.clearErrors();
            this._passwordConfirmInput.clearErrors();
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            if (_window == null)
            {
                _window = _SafeStr_3263(_navigator.getXmlWindow("ros_room_settings"));
            };
            if (!_useUnifiedWindow)
            {
                _window.findChildByName("tab_1").procedure = onTab;
                _window.findChildByName("tab_2").procedure = onTab;
                _window.findChildByName("tab_3").procedure = onTab;
                _window.findChildByName("tab_4").procedure = onTab;
                _window.findChildByName("tab_5").procedure = onTab;
            };
            _window.findChildByName("builders_faq_button").procedure = onBuildersClubFaqButtonClick;
            showDeleteButton();
            var _local_2:IRadioButtonWindow = (_window.findChildByName("doormode_password") as IRadioButtonWindow);
            _local_2.addEventListener("WE_SELECT", onDoorModePasswordSelect);
            _local_2.addEventListener("WE_UNSELECT", onDoorModePasswordUnselect);
            _window.findChildByTag("close").addEventListener("WME_CLICK", onClose);
            getRemoveAllFlatCtrlsButton().addEventListener("WME_CLICK", onRemoveAllFlatCtrlsClick);
            _window.findChildByName("filter_users_input").addEventListener("WE_CHANGE", onUserFilterChange);
            _removeTabsForNavigatorView = ((!(_navigator.data.enteredGuestRoom)) || (!(_navigator.data.enteredGuestRoom.flatId == _originalData.roomId)));
            if (_removeTabsForNavigatorView)
            {
                _window.findChildByName("remove_link_region").visible = false;
            }
            else
            {
                _window.findChildByName("remove_link_region").procedure = onDeleteButtonClick;
            };
            _nameInput = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("room_name")), 60);
            _descInput = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("description")), 0xFF);
            _tag1Input = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("tag1")), 30);
            _tag2Input = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("tag2")), 30);
            _passwordInput = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("password")), 30);
            _passwordConfirmInput = new TextFieldManager(_navigator, ITextFieldWindow(_window.findChildByName("password_confirm")), 30);
            _allowPetsCheckBox = _SafeStr_3158(_window.findChildByName("allow_pets_checkbox"));
            _allowFoodConsumeCheckBox = _SafeStr_3158(_window.findChildByName("allow_foodconsume_checkbox"));
            _allowWalkThroughCheckBox = _SafeStr_3158(_window.findChildByName("allow_walk_through_checkbox"));
            _allowWalkThroughCheckBox.addEventListener("WME_OVER", onWalkThroughMouseOver);
            _allowDynCatsCheckBox = _SafeStr_3158(_window.findChildByName("allow_dyncats_checkbox"));
            _allowDynCatsCheckBox.visible = true;
            _window.findChildByName("allow_dyncats_text").visible = true;
            _hideWallsCheckBox = _SafeStr_3158(_window.findChildByName("hide_walls_checkbox"));
            _hideWallsText = (_window.findChildByName("hide_walls_text") as ITextWindow);
            _wallThicknessDropMenu = _SafeStr_3269(_window.findChildByName("wall_thickness"));
            _floorThicknessDropMenu = _SafeStr_3269(_window.findChildByName("floor_thickness"));
            _tabContext = ITabContextWindow(_window.findChildByName("tab_context"));
            _chatModeDropMenu = _SafeStr_3269(_window.findChildByName("chat_mode"));
            _chatBubbleWidthDropMenu = _SafeStr_3269(_window.findChildByName("chat_bubbles_width"));
            _chatBubbleWidthDropMenu.addEventListener("WME_OVER", onBubbleWidthMouseOver);
            _chatScrollSpeedDropMenu = _SafeStr_3269(_window.findChildByName("chat_scroll_speed"));
            _chatScrollSpeedDropMenu.addEventListener("WME_OVER", onChatScrollSpeedMouseOver);
            _floodFilterDropMenu = _SafeStr_3269(_window.findChildByName("chat_flood_sensitivity"));
            _floodFilterDropMenu.addEventListener("WME_OVER", onFloodFilterMouseOver);
            _chatSettingsTitleText = ITextWindow(_window.findChildByName("chat_settings_text"));
            _chatSettingsInfoText = ITextWindow(_window.findChildByName("chat_settings_info"));
            _chatFullHearRangeTextField = ITextFieldWindow(_window.findChildByName("chat_settings_hearing_distance"));
            _chatFullHearRangeTextField.addEventListener("WME_OVER", onFullHearRangeMouseOver);
            _chatFullHearRangeInput = new TextFieldManager(_navigator, _chatFullHearRangeTextField, 2);
            var _local_5:Array = [_nameInput, _descInput, _tag1Input, _tag2Input, _passwordInput, _passwordConfirmInput, _chatFullHearRangeInput];
            for each (var _local_4:TextFieldManager in _local_5)
            {
                _local_4.input.addEventListener("WE_UNFOCUSED", onUnfocus);
            };
            var _local_7:Array = [_window.findChildByName("categories"), _window.findChildByName("maxvisitors"), _window.findChildByName("tradesettings"), _allowPetsCheckBox, _allowFoodConsumeCheckBox, _allowWalkThroughCheckBox, _allowDynCatsCheckBox, _hideWallsCheckBox, _wallThicknessDropMenu, _floorThicknessDropMenu, _chatBubbleWidthDropMenu, _chatModeDropMenu, _chatScrollSpeedDropMenu, _floodFilterDropMenu];
            for each (var _local_6:_SafeStr_3109 in _local_7)
            {
                _local_6.addEventListener("WE_SELECTED", onUnfocus);
                _local_6.addEventListener("WE_UNSELECTED", onUnfocus);
            };
            _window.findChildByName("doormode_open").addEventListener("WE_SELECTED", onUnfocus);
            _window.findChildByName("doormode_doorbell").addEventListener("WE_SELECTED", onUnfocus);
            _window.findChildByName("doormode_password").addEventListener("WE_SELECTED", onUnfocus);
            _window.findChildByName("doormode_invisible").addEventListener("WE_SELECTED", onUnfocus);
            var _local_1:Array = [_window.findChildByName("moderation_mute_none"), _window.findChildByName("moderation_mute_rights"), _window.findChildByName("moderation_kick_none"), _window.findChildByName("moderation_kick_rights"), _window.findChildByName("moderation_kick_all"), _window.findChildByName("moderation_ban_none"), _window.findChildByName("moderation_ban_rights")];
            for each (var _local_3:_SafeStr_3109 in _local_1)
            {
                _local_3.addEventListener("WE_SELECT", onUnfocus);
            };
            getPasswordContainer().visible = false;
            _window.findChildByName("remove_icon").x = (_window.findChildByName("remove_link").x - 15);
            _window.findChildByName("tradesettings_label").visible = true;
            _window.findChildByName("tradesettings").visible = true;
            _window.findChildByName("moderation_unban_btn").addEventListener("WME_CLICK", onUnbanClick);
            _window.center();
            switchToTab(1);
        }

        private function onBubbleWidthMouseOver(_arg_1:WindowMouseEvent):void
        {
        }

        private function refreshNavigatorTabs():void
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:Boolean;
            _tabContext = ITabContextWindow(_window.findChildByName("tab_context"));
            _local_3 = 0;
            while (_local_3 < _tabContext.numTabItems)
            {
                _local_1 = _tabContext.getTabItemAt(_local_3);
                _local_2 = ((_removeTabsForNavigatorView) && ((_local_1.id == 2) || (_local_1.id == 3)));
                _local_1.visible = (!(_local_2));
                _local_3++;
            };
            _tabContext.selector.setSelected(ISelectableWindow(_window.findChildByName(("tab_" + _currentTab))));
        }

        private function resizeTabs():void
        {
            var _local_5:int;
            var _local_4:int;
            var _local_2:* = null;
            var _local_3:Boolean;
            var _local_6:int;
            _local_5 = 0;
            while (_local_5 < _tabContext.numTabItems)
            {
                if (_tabContext.getTabItemAt(_local_5).visible)
                {
                    _local_6++;
                };
                _local_5++;
            };
            var _local_1:int = int((_window.width / _local_6));
            _local_1 = (_local_1 - 1);
            _local_4 = 0;
            while (_local_4 < _tabContext.numTabItems)
            {
                _local_2 = _tabContext.getTabItemAt(_local_4);
                _local_3 = ((_removeTabsForNavigatorView) && ((_local_2.id == 2) || (_local_2.id == 3)));
                _local_2.width = ((_local_3) ? 0 : _local_1);
                _local_4++;
            };
        }

        private function showDeleteButton():void
        {
            if (_navigator.sessionData.isAccountSafetyLocked())
            {
                _window.findChildByName("remove_link_region").disable();
                _window.findChildByName("remove_link").blend = 0.5;
                _window.findChildByName("remove_icon").blend = 0.5;
            }
            else
            {
                _window.findChildByName("remove_link_region").enable();
                _window.findChildByName("remove_link").blend = 1;
                _window.findChildByName("remove_icon").blend = 1;
            };
        }

        private function getPasswordContainer():_SafeStr_3133
        {
            return (_SafeStr_3133(_window.findChildByName("password_container")));
        }

        private function getRemoveAllFlatCtrlsButton():_SafeStr_3122
        {
            return (_SafeStr_3122(_window.findChildByName("remove_all_flat_ctrls")));
        }

        private function getRemoveFlatCtrlsButton():_SafeStr_3122
        {
            return (_SafeStr_3122(_window.findChildByName("remove_flat_ctrl")));
        }

        public function refresh():void
        {
            prepareWindow();
            if (!_useUnifiedWindow)
            {
                Util.hideChildren(_SafeStr_3133(_window.findChildByName("content_container")));
                getTabContainer(_currentTab).visible = true;
            };
            refreshNavigatorTabs();
            resizeTabs();
            _window.helpPage = getHelpPageWithTab(_currentTab);
            refreshFlatControllers();
            refreshBannedUsers();
            refreshGroupMemberDisclaimer();
            showDeleteButton();
            _window.invalidate();
        }

        private function getTabContainer(_arg_1:int):_SafeStr_3133
        {
            return (_SafeStr_3133(_window.findChildByName(("tab_container_" + _arg_1))));
        }

        private function disableWindow(_arg_1:_SafeStr_3109):void
        {
            if (_arg_1 != null)
            {
                _arg_1.disable();
                _arg_1.blend = 0.5;
            };
        }

        private function enableWindow(_arg_1:_SafeStr_3109):void
        {
            if (_arg_1 != null)
            {
                _arg_1.enable();
                _arg_1.blend = 1;
            };
        }

        private function getThicknessSelectionIndex(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case -2:
                    return (0);
                case -1:
                    return (1);
                case 1:
                    return (3);
                default:
                    return (2);
                    return; //dead code
            };
        }

        private function populateForm():void
        {
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            _populating = true;
            var _local_2:_SafeStr_1553 = _originalData;
            _nameInput.setText(_local_2.name);
            _descInput.setText(_local_2.description);
            _passwordInput.setText("");
            _passwordConfirmInput.setText("");
            var _local_4:ISelectorWindow = (_window.findChildByName("doormode") as ISelectorWindow);
            if (_navigator.data.enteredGuestRoom)
            {
                _window.findChildByName("doormode_override_info").visible = ((_navigator.isDoorModeOverriddenInCurrentRoom) && (!(_navigator.sessionData.hasSecurity(4))));
                switch (_local_2.doorMode)
                {
                    case 1:
                        _local_3 = (_window.findChildByName("doormode_doorbell") as IRadioButtonWindow);
                        _local_4.setSelected(_local_3);
                        break;
                    case 2:
                        _local_1 = (_window.findChildByName("doormode_password") as IRadioButtonWindow);
                        _local_4.setSelected(_local_1);
                        break;
                    case 3:
                        _local_5 = (_window.findChildByName("doormode_invisible") as IRadioButtonWindow);
                        _local_4.setSelected(_local_5);
                        break;
                    case 4:
                        break;
                    default:
                        _local_6 = (_window.findChildByName("doormode_open") as IRadioButtonWindow);
                        _local_4.setSelected(_local_6);
                };
                changePasswordField((_local_2.doorMode == 2));
            };
            _SafeStr_14.log(("CATEGORY ID: " + _local_2.categoryId));
            setCategorySelection(_local_2.categoryId);
            setTradeModeSelection(_local_2.tradeMode);
            refreshMaxVisitors(_local_2);
            setTag(_tag1Input, _local_2.tags[0]);
            setTag(_tag2Input, _local_2.tags[1]);
            if (_allowPetsCheckBox)
            {
                if (_local_2.allowPets)
                {
                    this._allowPetsCheckBox.select();
                }
                else
                {
                    this._allowPetsCheckBox.unselect();
                };
            };
            if (_allowFoodConsumeCheckBox)
            {
                if (_local_2.allowFoodConsume)
                {
                    _allowFoodConsumeCheckBox.select();
                }
                else
                {
                    _allowFoodConsumeCheckBox.unselect();
                };
            };
            if (_allowWalkThroughCheckBox)
            {
                if (_local_2.allowWalkThrough)
                {
                    _allowWalkThroughCheckBox.select();
                }
                else
                {
                    _allowWalkThroughCheckBox.unselect();
                };
            };
            if (_allowDynCatsCheckBox)
            {
                if (_local_2.allowNavigatorDynamicCats)
                {
                    _allowDynCatsCheckBox.select();
                }
                else
                {
                    _allowDynCatsCheckBox.unselect();
                };
            };
            if (!VIPFeaturesAllowed())
            {
                disableWindow(_hideWallsCheckBox);
                disableWindow(_wallThicknessDropMenu);
                disableWindow(_floorThicknessDropMenu);
                disableWindow(_hideWallsText);
            }
            else
            {
                enableWindow(_hideWallsCheckBox);
                enableWindow(_wallThicknessDropMenu);
                enableWindow(_floorThicknessDropMenu);
                enableWindow(_hideWallsText);
            };
            if (_hideWallsCheckBox)
            {
                if (_local_2.hideWalls)
                {
                    _hideWallsCheckBox.select();
                }
                else
                {
                    _hideWallsCheckBox.unselect();
                };
            };
            _chatModeDropMenu.selection = _local_2.chatSettings.mode;
            _chatBubbleWidthDropMenu.selection = _local_2.chatSettings.bubbleWidth;
            _chatScrollSpeedDropMenu.selection = _local_2.chatSettings.scrollSpeed;
            _chatFullHearRangeInput.setText(_local_2.chatSettings.fullHearRange.toString());
            _floodFilterDropMenu.selection = _local_2.chatSettings.floodSensitivity;
            if (_wallThicknessDropMenu)
            {
                _wallThicknessDropMenu.selection = getThicknessSelectionIndex(_local_2.wallThickness);
            };
            if (_floorThicknessDropMenu)
            {
                _floorThicknessDropMenu.selection = getThicknessSelectionIndex(_local_2.floorThickness);
            };
            populateRoomModerationSettings(_local_2);
            this.clearErrors();
            _populating = false;
        }

        private function populateRoomModerationSettings(_arg_1:_SafeStr_1553):void
        {
            var _local_4:* = (_groupId > 0);
            roomModerationMuteSettings = ((_local_4) ? [0, 1, 4, 5] : [0, 1]);
            roomModerationBanSettings = ((_local_4) ? [0, 1, 4, 5] : [0, 1]);
            roomModerationKickSettings = ((_local_4) ? [0, 1, 2, 4, 5] : [0, 1, 2]);
            var _local_2:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_mute_dropdown"));
            _local_2.populate(localizeItems(roomModerationMuteSettings));
            _local_2.selection = normalizeSelection(roomModerationMuteSettings, _arg_1.roomModerationSettings.whoCanMute);
            var _local_3:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_ban_dropdown"));
            _local_3.populate(localizeItems(roomModerationBanSettings));
            _local_3.selection = normalizeSelection(roomModerationBanSettings, _arg_1.roomModerationSettings.whoCanBan);
            var _local_6:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_kick_dropdown"));
            _local_6.populate(localizeItems(roomModerationKickSettings));
            _local_6.selection = normalizeSelection(roomModerationKickSettings, _arg_1.roomModerationSettings.whoCanKick);
            for each (var _local_5:_SafeStr_3109 in [_local_2, _local_3, _local_6])
            {
                _local_5.addEventListener("WE_SELECTED", onUnfocus);
                _local_5.addEventListener("WE_UNSELECTED", onUnfocus);
            };
        }

        private function normalizeSelection(_arg_1:Array, _arg_2:int):int
        {
            var _local_3:*;
            _local_3 = 0;
            while (_arg_1.length)
            {
                if (_arg_1[_local_3] == _arg_2)
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (0);
        }

        private function localizeItems(_arg_1:Array):*
        {
            var _local_2:Array = [];
            for each (var _local_3:int in _arg_1)
            {
                switch (_local_3)
                {
                    case 0:
                        _local_2.push("${navigator.roomsettings.moderation.none}");
                        break;
                    case 2:
                        _local_2.push("${navigator.roomsettings.moderation.all}");
                        break;
                    case 1:
                        _local_2.push("${navigator.roomsettings.moderation.rights}");
                        break;
                    case 4:
                        _local_2.push("${navigator.roomsettings.moderation.group_admins}");
                        break;
                    case 5:
                        _local_2.push("${navigator.roomsettings.moderation.group_admins_and_rights}");
                    default:
                };
            };
            return (_local_2);
        }

        private function VIPFeaturesAllowed():Boolean
        {
            return (_navigator.sessionData.hasVip);
        }

        private function refreshMaxVisitors(_arg_1:_SafeStr_1553):void
        {
            var _local_3:int;
            var _local_5:Array = [];
            var _local_6:int = -1;
            var _local_4:int;
            var _local_2:int = ((VIPFeaturesAllowed()) ? 75 : 50);
            _local_3 = 10;
            while (_local_3 <= _local_2)
            {
                _local_5.push(("" + _local_3));
                if (_local_3 == _arg_1.maximumVisitors)
                {
                    _local_6 = _local_4;
                };
                _local_4++;
                _local_3 = (_local_3 + 5);
            };
            if (_arg_1.maximumVisitors > _local_2)
            {
                _local_5.push(("" + _local_2));
                _local_6 = _local_4;
            };
            var _local_7:_SafeStr_3269 = (_window.findChildByName("maxvisitors") as _SafeStr_3269);
            _local_7.populate(_local_5);
            _local_7.selection = ((_local_6 > -1) ? _local_6 : 0);
        }

        private function setCategorySelection(_arg_1:int):void
        {
            var _local_2:_SafeStr_3269 = (_window.findChildByName("categories") as _SafeStr_3269);
            var _local_4:Array = [];
            var _local_6:int;
            var _local_3:int;
            for each (var _local_5:_SafeStr_1629 in _navigator.data.allCategories)
            {
                if ((((_local_5.visible) || (_arg_1 == _local_5.nodeId)) && (!(_local_5.automatic))))
                {
                    _local_4.push(_local_5.visibleName);
                    if (_arg_1 == _local_5.nodeId)
                    {
                        _local_6 = _local_3;
                    };
                    _local_3++;
                };
            };
            _local_2.populate(_local_4);
            _local_2.selection = _local_6;
        }

        private function setTradeModeSelection(_arg_1:int):void
        {
            var _local_2:_SafeStr_3269 = (_window.findChildByName("tradesettings") as _SafeStr_3269);
            var _local_3:Array = [];
            _local_3.push("${navigator.roomsettings.trade_not_allowed}");
            _local_3.push("${navigator.roomsettings.trade_not_with_Controller}");
            _local_3.push("${navigator.roomsettings.trade_allowed}");
            _local_2.populate(_local_3);
            _local_2.selection = _arg_1;
        }

        private function getFlatCategoryByIndex(_arg_1:int, _arg_2:int):_SafeStr_1629
        {
            var _local_3:int;
            for each (var _local_4:_SafeStr_1629 in _navigator.data.allCategories)
            {
                if ((((_local_4.visible) || (_arg_1 == _local_4.nodeId)) && (!(_local_4.automatic))))
                {
                    if (_arg_2 == _local_3)
                    {
                        return (_local_4);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            close();
        }

        private function onUnfocus(_arg_1:_SafeStr_3116):void
        {
            if (!_populating)
            {
                save();
            };
        }

        private function save():void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            if ((((_originalData == null) || (_window == null)) || (_window.disposed)))
            {
                return;
            };
            var _local_3:_SafeStr_1363 = new _SafeStr_1363();
            _local_3.roomId = _originalData.roomId;
            _local_3.name = _nameInput.getText();
            _local_3.description = _descInput.getText();
            var _local_6:ISelectorWindow = (_window.findChildByName("doormode") as ISelectorWindow);
            var _local_5:_SafeStr_3109 = _local_6.getSelected();
            if (_local_5 == null)
            {
                _local_3.doorMode = _originalData.doorMode;
            }
            else
            {
                switch (_local_5.name)
                {
                    case "doormode_doorbell":
                        _local_3.doorMode = 1;
                        break;
                    case "doormode_password":
                        _local_3.doorMode = 2;
                        break;
                    case "doormode_invisible":
                        _local_3.doorMode = 3;
                        break;
                    default:
                        _local_3.doorMode = 0;
                };
            };
            if (_local_3.doorMode == 2)
            {
                _local_2 = _passwordInput.getText();
                _local_4 = _passwordConfirmInput.getText();
                if (_local_2 != _local_4)
                {
                    this._passwordInput.clearErrors();
                    this.switchToTab(2);
                    this._passwordConfirmInput.displayError("${navigator.roomsettings.invalidconfirm}");
                    return;
                };
                if (_local_2 != "")
                {
                    _local_3.password = _local_2;
                };
            };
            var _local_7:_SafeStr_3269 = (_window.findChildByName("categories") as _SafeStr_3269);
            var _local_8:_SafeStr_1629 = getFlatCategoryByIndex(_originalData.categoryId, _local_7.selection);
            _local_3.categoryId = _local_8.nodeId;
            var _local_1:_SafeStr_3269 = (_window.findChildByName("tradesettings") as _SafeStr_3269);
            _local_3.tradeMode = _local_1.selection;
            var _local_9:_SafeStr_3269 = (_window.findChildByName("maxvisitors") as _SafeStr_3269);
            _local_3.maximumVisitors = _local_9.enumerateSelection()[_local_9.selection];
            _local_3.allowPets = _allowPetsCheckBox.isSelected;
            _local_3.allowFoodConsume = _allowFoodConsumeCheckBox.isSelected;
            _local_3.allowWalkThrough = _allowWalkThroughCheckBox.isSelected;
            _local_3.allowNavigatorDynCats = _allowDynCatsCheckBox.isSelected;
            _local_3.hideWalls = _hideWallsCheckBox.isSelected;
            _local_3.wallThickness = (_wallThicknessDropMenu.selection - 2);
            _local_3.floorThickness = (_floorThicknessDropMenu.selection - 2);
            _local_3.tags = [];
            addTag(_tag1Input, _local_3.tags);
            addTag(_tag2Input, _local_3.tags);
            setModeratorSettings(_local_3);
            _local_3.chatMode = _chatModeDropMenu.selection;
            _local_3.chatBubbleSize = _chatBubbleWidthDropMenu.selection;
            _local_3.chatScrollUpFrequency = _chatScrollSpeedDropMenu.selection;
            _local_3.chatFullHearRange = _chatFullHearRangeInput.getText();
            _local_3.chatFloodSensitivity = _floodFilterDropMenu.selection;
            this.clearErrors();
            this._savedFlatId = _local_3.roomId;
            _navigator.send(new _SafeStr_433(_local_3));
        }

        private function addTag(_arg_1:TextFieldManager, _arg_2:Array):void
        {
            var _local_3:* = null;
            if (_arg_1.getText() != "")
            {
                _local_3 = _arg_1.getText();
                if (((useHashTags) && (_local_3.charAt(0) == "#")))
                {
                    _local_3 = _local_3.substr(1, (_local_3.length - 1));
                };
                _arg_2.push(_local_3);
            };
        }

        private function setModeratorSettings(_arg_1:_SafeStr_1363):void
        {
            var _local_2:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_mute_dropdown"));
            _arg_1.whoCanMute = roomModerationMuteSettings[_local_2.selection];
            var _local_3:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_ban_dropdown"));
            _arg_1.whoCanBan = roomModerationBanSettings[_local_3.selection];
            var _local_4:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("moderation_kick_dropdown"));
            _arg_1.whoCanKick = roomModerationKickSettings[_local_4.selection];
        }

        private function onDeleteButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_flatId == _navigator.homeRoomId)
            {
                _navigator.windowManager.alert("${navigator.delete.homeroom.title}", "${navigator.delete.homeroom.body}", 0, onAlertClose);
                return;
            };
            if (_groupId > 0)
            {
                _navigator.windowManager.alert("${group.deletebase.title}", "${group.deletebase.body}", 0, onAlertClose);
                return;
            };
            _SafeStr_14.log(("[RoomSettingsCtrl.onDeleteButtonClick] " + _flatId));
            if (_originalData == null)
            {
                return;
            };
            if (_confirmDialog != null)
            {
                _confirmDialog.dispose();
            };
            _navigator.registerParameter("navigator.roomsettings.deleteroom.confirm.message", "room_name", _originalData.name);
            _confirmDialog = new ConfirmDialogView(_navigator, onConfirmRoomDelete, "${navigator.roomsettings}", "${navigator.roomsettings.deleteroom.confirm.message}");
        }

        private function onBuildersClubFaqButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_navigator.windowManager != null)
            {
                (_navigator.windowManager as Component).context.createLinkEvent("habbopages/builders-club/faq");
            };
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function onConfirmRoomDelete():void
        {
            var _local_1:* = null;
            _navigator.send(new _SafeStr_811(_originalData.roomId));
            close();
            if (_navigator.data.guestRoomSearchResults != null)
            {
                _local_1 = _navigator.data.guestRoomSearchResults;
                _navigator.mainViewCtrl.startSearch(_navigator.tabs.getSelected().id, _local_1.searchType, _local_1.searchParam);
            };
        }

        private function onDoorModePasswordSelect(_arg_1:_SafeStr_3116):void
        {
            changePasswordField(true);
        }

        private function onDoorModePasswordUnselect(_arg_1:_SafeStr_3116):void
        {
            changePasswordField(false);
        }

        private function changePasswordField(_arg_1:Boolean):void
        {
            getPasswordContainer().visible = _arg_1;
        }

        private function refreshGroupMemberDisclaimer():void
        {
            if (!isContentVisible(2))
            {
                return;
            };
            if (!_navigator.data.enteredGuestRoom)
            {
                return;
            };
            var _local_1:* = (_navigator.data.enteredGuestRoom.habboGroupId > 0);
            _window.findChildByName("guild_access_disclaimer").visible = _local_1;
        }

        private function refreshFlatControllers():void
        {
            var _local_2:* = null;
            if (!isContentVisible(3))
            {
                return;
            };
            if (!_navigator.data.enteredGuestRoom)
            {
                return;
            };
            if (_originalData.controllersById == null)
            {
                _originalData.controllersById = new Dictionary();
                _navigator.send(new _SafeStr_824(_originalData.roomId));
                _local_2 = [];
            }
            else
            {
                _local_2 = _originalData.controllerList;
            };
            var _local_1:String = ITextWindow(_window.findChildByName("filter_users_input")).text.toLowerCase();
            var _local_3:Array = getFriendsWithNoRights();
            _usersWithRightsListCtrl.refresh(IItemListWindow(_window.findChildByName("users_with_rights_item_list")), _local_2, _local_1, _originalData.highlightedUserId);
            _friendsListCtrl.refresh(IItemListWindow(_window.findChildByName("friends_item_list")), _local_3, _local_1, _originalData.highlightedUserId);
            _navigator.registerParameter("navigator.flatctrls.userswithrights", "displayed", ("" + _usersWithRightsListCtrl.userCount));
            _navigator.registerParameter("navigator.flatctrls.friends", "displayed", ("" + _friendsListCtrl.userCount));
            _navigator.registerParameter("navigator.flatctrls.userswithrights", "total", ("" + _local_2.length));
            _navigator.registerParameter("navigator.flatctrls.friends", "total", ("" + _local_3.length));
        }

        private function refreshBannedUsers():void
        {
            var _local_1:* = null;
            if (_currentTab != 5)
            {
                return;
            };
            if (_originalData.bannedUsersById == null)
            {
                _navigator.send(new _SafeStr_943(_originalData.roomId));
                _local_1 = [];
            }
            else
            {
                _local_1 = _originalData.bannedUsersList;
            };
            _bannedUsersListCtrl.refresh(IItemListWindow(_window.findChildByName("moderation_banned_users")), _local_1, "", 0);
        }

        private function getFriendsWithNoRights():Array
        {
            var _local_1:Dictionary = _originalData.controllersById;
            var _local_3:Array = [];
            if (_local_1.length == 0)
            {
                return (_local_3);
            };
            for each (var _local_2:_SafeStr_1627 in _navigator.data.friendList.list)
            {
                if (_local_1[_local_2.userId] == null)
                {
                    _local_3.push(_local_2);
                };
            };
            return (_local_3);
        }

        private function onRemoveAllFlatCtrlsClick(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_14.log("Remove all clicked: ");
            if (_confirmDialog != null)
            {
                _confirmDialog.dispose();
            };
            _confirmDialog = new ConfirmDialogView(_navigator, onRemoveAllFlatCtrlsConfirm, "${navigator.flatctrls.removeconfirm.title}", "${navigator.flatctrls.removeconfirm.info}");
        }

        private function onRemoveAllFlatCtrlsConfirm():void
        {
            _navigator.send(new _SafeStr_767(this._flatId));
        }

        private function onTab(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _currentTab = _arg_2.id;
            refresh();
            if (_currentTab == 2)
            {
                _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "select", "room.settings.doormode.seen");
            };
        }

        private function onUserFilterChange(_arg_1:_SafeStr_3116):void
        {
            refreshFlatControllers();
        }

        private function onUnbanClick(_arg_1:WindowMouseEvent):void
        {
            if (_bannedUsersListCtrl.selectedRow < 0)
            {
                return;
            };
            var _local_3:IItemListWindow = (_window.findChildByName("moderation_banned_users") as IItemListWindow);
            var _local_2:_SafeStr_3109 = _SafeStr_3133(_local_3.getListItemAt(_bannedUsersListCtrl.selectedRow)).findChildByName("user_info_region");
            var _local_4:int = _local_2.id;
            _navigator.send(new _SafeStr_935(_local_4, _flatId));
        }

        private function getHelpPageWithTab(_arg_1:int):String
        {
            if (_arg_1 == 4)
            {
                return ("chat/options");
            };
            return ("");
        }

        public function get linkPattern():String
        {
            return ("roomsettings/");
        }

        public function linkReceived(_arg_1:String):void
        {
        }

        private function onWalkThroughMouseOver(_arg_1:WindowMouseEvent):void
        {
            _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.walkthrough.seen");
        }

        private function onChatScrollSpeedMouseOver(_arg_1:WindowMouseEvent):void
        {
            _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.scrollspeed.seen");
        }

        private function onFloodFilterMouseOver(_arg_1:WindowMouseEvent):void
        {
            _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.floodfilter.seen");
        }

        private function onFullHearRangeMouseOver(_arg_1:WindowMouseEvent):void
        {
            _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "hover", "room.settings.chat.hearrange.seen");
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_1025 = "_-f1e" (String#15828, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1363 = "_-ci" (String#19106, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1553 = "_-R1f" (String#13987, DoABC#4)
// _SafeStr_1627 = "_-k1s" (String#15391, DoABC#4)
// _SafeStr_1628 = "_-m19" (String#28925, DoABC#4)
// _SafeStr_1629 = "_-K0" (String#4251, DoABC#4)
// _SafeStr_1634 = "_-I1T" (String#11183, DoABC#4)
// _SafeStr_1639 = "_-O1B" (String#41005, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_433 = "_-S1C" (String#29183, DoABC#4)
// _SafeStr_767 = "_-t1p" (String#30708, DoABC#4)
// _SafeStr_811 = "_-mv" (String#28534, DoABC#4)
// _SafeStr_824 = "_-v12" (String#29610, DoABC#4)
// _SafeStr_935 = "_-e1z" (String#29270, DoABC#4)
// _SafeStr_943 = "_-F1n" (String#30857, DoABC#4)


