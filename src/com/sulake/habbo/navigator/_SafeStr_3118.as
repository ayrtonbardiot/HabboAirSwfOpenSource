// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator._SafeStr_3118

package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication._SafeStr_25;
    import _-Ja._SafeStr_466;
    import _-JS._SafeStr_404;
    import _-1O._SafeStr_400;
    import _-Ja._SafeStr_717;
    import _-y1x._SafeStr_605;
    import _-Ja._SafeStr_682;
    import _-Ja._SafeStr_843;
    import _-n1H._SafeStr_311;
    import _-n1H._SafeStr_903;
    import _-Ja._SafeStr_787;
    import _-Ja._SafeStr_571;
    import _-g1x._SafeStr_285;
    import _-Ja._SafeStr_499;
    import _-n1H._SafeStr_865;
    import _-Ja._SafeStr_972;
    import _-Ja._SafeStr_591;
    import _-yL._SafeStr_461;
    import _-y1x._SafeStr_823;
    import _-Ja._SafeStr_128;
    import _-n1H._SafeStr_1013;
    import _-Ja._SafeStr_748;
    import _-Ja._SafeStr_507;
    import _-y1x._SafeStr_346;
    import _-Ja._SafeStr_432;
    import _-n1H._SafeStr_724;
    import _-yL._SafeStr_528;
    import _-n1H._SafeStr_789;
    import _-Nk._SafeStr_551;
    import _-Ja._SafeStr_707;
    import _-yL._SafeStr_142;
    import _-n1H._SafeStr_513;
    import _-Ja._SafeStr_703;
    import _-Ja._SafeStr_1010;
    import _-n1H._SafeStr_977;
    import _-n1H._SafeStr_997;
    import _-y1x._SafeStr_127;
    import _-Ol._SafeStr_484;
    import _-Ja._SafeStr_288;
    import _-W1K._SafeStr_990;
    import _-n1H._SafeStr_966;
    import _-Ja._SafeStr_876;
    import _-Ja._SafeStr_463;
    import _-n1H._SafeStr_924;
    import _-Ja._SafeStr_444;
    import _-JS._SafeStr_373;
    import _-n1H._SafeStr_678;
    import _-Ja._SafeStr_918;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import _-Z1C._SafeStr_1290;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1185;
    import _-M1k._SafeStr_781;
    import _-M1k._SafeStr_934;
    import _-31H._SafeStr_1303;
    import _-31H._SafeStr_1284;
    import _-Ja._SafeStr_1634;
    import _-Ja._SafeStr_1621;
    import _-31H._SafeStr_1085;
    import _-31H._SafeStr_1264;
    import _-61T._SafeStr_1254;
    import _-M1k._SafeStr_525;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-31H._SafeStr_1082;
    import _-31H._SafeStr_1512;
    import com.sulake.core.utils.ErrorReportStorage;
    import _-NF._SafeStr_1274;
    import _-l1n._SafeStr_1132;
    import _-31H._SafeStr_1105;
    import _-31H._SafeStr_1184;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import _-Po._SafeStr_428;
    import _-31H._SafeStr_1293;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import _-31H._SafeStr_1059;
    import _-l1Q._SafeStr_1172;
    import _-Z1C._SafeStr_1211;
    import _-Z1C._SafeStr_1417;
    import _-Z1C._SafeStr_1128;
    import _-31H._SafeStr_1375;
    import _-31H._SafeStr_1486;
    import _-31H._SafeStr_1354;
    import _-31H._SafeStr_1389;
    import _-Z1C._SafeStr_1110;
    import _-Z1C._SafeStr_1313;
    import _-Z1C._SafeStr_1208;
    import _-Z1C._SafeStr_1339;
    import _-Z1C._SafeStr_1329;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-l1n._SafeStr_1418;
    import _-31H._SafeStr_1424;
    import _-31H._SafeStr_1438;
    import com.sulake.core.window._SafeStr_3109;
    import _-l1n._SafeStr_1338;
    import _-IR._SafeStr_316;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import _-Z1C._SafeStr_1485;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 
    {

        private var _navigator:HabboNavigator;

        public function _SafeStr_3118(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
            var _local_2:_SafeStr_25 = _navigator.communication;
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_466(onNavigatorSettings));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_404(onFriendListUpdate));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_400(onGameStarted));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_717(onFavouriteChanged));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_605(onRoomExit));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_682(onCanCreateRoomEventEvent));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_843(onRoomInfo));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_311(onRoomSettingsError));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_903(onMuteAllEvent));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_787(onDoorbell));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_571(onUserFlatCats));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_285(onNoOwnedRoomsAlert));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_499(onUserEventCats));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_865(onBannedUsersFromRoom));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_972(onFlatAccessDenied));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_591(onRoomEventEvent));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_461(onError));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_823(onCantConnect));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_128(onFavourites));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_1013(onNoSuchFlat));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_748(onFlatCreated));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_507(onCompetitionData));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_346(onDoorOpened));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_432(onGuestRoomSearchResult));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_724(onRoomSettingsData));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_789(onFlatControllerRemoved));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_551(onRoomFilterSettings));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_707(onRoomEventCancel));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_513(onRoomSettingsSaved));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_703(onRoomRating));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_1010(onConvertedRoomId));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_977(onFlatControllerAdded));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_997(onUserUnbannedFromRoom));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_127(onRoomForward));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_288(onOfficialRooms));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_990(onSubscriptionInfo));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_966(onEnforceRoomCategorySelection));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_876(onPopularRoomTagsResult));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_463(onRoomInfoUpdated));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_924(onRoomSettingsSaveError));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_444(onCategoriesWithUserCount));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_373(onFriendsListFragment));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_678(onFlatControllers));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_918(onCanCreateRoom));
        }

        public function get data():NavigatorData
        {
            return (_navigator.data);
        }

        private function onMuteAllEvent(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_903 = (_arg_1 as _SafeStr_903);
            var _local_3:_SafeStr_1290 = _local_4.getParser();
            var _local_2:_SafeStr_1569 = _navigator.data.enteredGuestRoom;
            if (_local_2 != null)
            {
                _local_2.allInRoomMuted = _local_3.allMuted;
                if (_navigator.roomInfoViewCtrl != null)
                {
                    _navigator.roomInfoViewCtrl.refreshButtons(_navigator.data.enteredGuestRoom);
                };
            };
        }

        private function onNoSuchFlat(_arg_1:IMessageEvent):void
        {
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = _SafeStr_528(_arg_1).getParser();
            data.avatarId = _local_2.id;
            _navigator.send(new _SafeStr_781());
            _navigator.send(new _SafeStr_934());
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_142 = _SafeStr_142(_arg_1);
            if (_local_2.securityLevel >= 5)
            {
                _navigator.data.eventMod = true;
            };
            if (_local_2.securityLevel >= 7)
            {
                _navigator.data.roomPicker = true;
            };
        }

        private function onCategoriesWithUserCount(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1303 = _SafeStr_444(_arg_1).getParser();
            data.categoriesWithVisitorData = _local_2.data;
            _SafeStr_14.log(("Received Categories with user count: " + data.categoriesWithVisitorData.categoryToCurrentUserCountMap.length));
        }

        private function onOfficialRooms(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1284 = _SafeStr_288(_arg_1).getParser();
            data.officialRooms = _local_2.data;
            data.adRoom = _local_2.adRoom;
            data.promotedRooms = _local_2.promotedRooms;
            _SafeStr_14.log(("Received Official rooms: " + data.officialRooms.entries.length));
        }

        private function onGuestRoomSearchResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1634 = _SafeStr_432(_arg_1).getParser().data;
            data.guestRoomSearchResults = _local_2;
            _SafeStr_14.log(("Received GuestRoomSearch: " + data.guestRoomSearchResults.rooms.length));
        }

        private function onPopularRoomTagsResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1621 = _SafeStr_876(_arg_1).getParser().data;
            data.popularTags = _local_2;
            _SafeStr_14.log(("Received popular room tags: " + data.popularTags.tags.length));
        }

        private function onRoomEventEvent(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1085 = _SafeStr_591(_arg_1).getParser();
            _SafeStr_14.log(((("Got room event: " + _local_2.data.ownerAvatarId) + ", ") + _local_2.data.eventName));
            data.roomEventData = ((_local_2.data.ownerAvatarId > 0) ? _local_2.data : null);
            _navigator.roomEventInfoCtrl.refresh();
        }

        private function onRoomEventCancel(_arg_1:IMessageEvent):void
        {
            data.roomEventData = null;
            _navigator.roomEventInfoCtrl.refresh();
        }

        private function onCanCreateRoomEventEvent(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1264 = _SafeStr_682(_arg_1).getParser();
            _SafeStr_14.log(("CAN CREATE EVENT: " + _local_2.canCreateEvent));
            if (_local_2.canCreateEvent)
            {
                _navigator.roomEventViewCtrl.show();
            }
            else
            {
                _local_3 = new SimpleAlertView(_navigator, "${navigator.cannotcreateevent.title}", (("${navigator.cannotcreateevent.error." + _local_2.errorCode) + "}"));
                _local_3.show();
                _SafeStr_14.log("Cannot create an event just now...");
            };
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1254 = _SafeStr_484(_arg_1).getParser();
            _SafeStr_14.log("Navigator: entering room");
            data.onRoomEnter(_local_2);
            closeOpenCantConnectAlerts();
            _navigator.roomInfoViewCtrl.close();
            _navigator.send(new _SafeStr_525(_local_2.guestRoomId, true, false));
            _SafeStr_14.log("Sent get guest room...");
            _navigator.roomEventInfoCtrl.refresh();
            _navigator.roomEventViewCtrl.close();
            _navigator.roomSettingsCtrl.close();
            _navigator.roomFilterCtrl.close();
            HabboWebTools.closeNews();
        }

        private function onRoomInfo(_arg_1:IMessageEvent):void
        {
            var _local_3:Boolean;
            var _local_4:* = null;
            var _local_2:_SafeStr_1082 = _SafeStr_843(_arg_1).getParser();
            _SafeStr_14.log(((("Got room info: " + _local_2.enterRoom) + ", ") + _local_2.roomForward));
            if (_local_2.enterRoom)
            {
                data.enteredRoom = _local_2.data;
                data.currentRoomIsStaffPick = _local_2.staffPick;
                _local_3 = (data.createdFlatId == _local_2.data.flatId);
                if (((!(_local_3)) && (_local_2.data.displayRoomEntryAd)))
                {
                    requestRoomEnterAd();
                };
                data.createdFlatId = 0;
                if (((!(data.enteredGuestRoom == null)) && (data.enteredGuestRoom.habboGroupId > 0)))
                {
                    _navigator.roomEventInfoCtrl.expanded = false;
                    _navigator.roomEventInfoCtrl.refresh();
                };
                _local_4 = _navigator.data.getAndResetSessionTags();
                if (_local_4 != null)
                {
                    _navigator.send(_local_4.getMsg());
                };
            }
            else
            {
                if (_local_2.roomForward)
                {
                    if (((_local_2.data.doorMode == 1) && ((!(_navigator.sessionData.userName == _local_2.data.ownerName)) && (_local_2.isGroupMember == false))))
                    {
                        _navigator.doorbell.show(_local_2.data);
                    }
                    else
                    {
                        if (((_local_2.data.doorMode == 2) && ((!(_navigator.sessionData.userName == _local_2.data.ownerName)) && (_local_2.isGroupMember == false))))
                        {
                            _navigator.passwordInput.show(_local_2.data);
                        }
                        else
                        {
                            if (((((_local_2.data.doorMode == 4) && (!(_navigator.sessionData.isAmbassador))) && (!(_navigator.sessionData.isRealNoob))) && (!(_navigator.sessionData.isAnyRoomController))))
                            {
                                return;
                            };
                            _navigator.goToRoom(_local_2.data.flatId, false);
                        };
                    };
                }
                else
                {
                    data.enteredRoom = _local_2.data;
                    data.currentRoomIsStaffPick = _local_2.staffPick;
                    _navigator.roomInfoViewCtrl.reload();
                };
            };
        }

        private function requestRoomEnterAd():void
        {
            if (_navigator.getProperty("roomenterad.habblet.enabled") == "true")
            {
                HabboWebTools.openRoomEnterAd();
            };
        }

        private function onFlatCreated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1512 = _SafeStr_748(_arg_1).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ((("Flat created: " + _local_2.flatId) + ", ") + _local_2.flatName));
            data.createdFlatId = _local_2.flatId;
            _navigator.goToRoom(_local_2.flatId, true);
            _navigator.mainViewCtrl.reloadRoomList(5);
            _navigator.goToMainView();
            _navigator.closeNavigator();
        }

        private function onGameStarted(_arg_1:IMessageEvent):void
        {
            _navigator.mainViewCtrl.close();
        }

        private function onSubscriptionInfo(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1274 = _SafeStr_990(_arg_1).getParser();
            _SafeStr_14.log(((((((((("Got subscription info: " + _local_2.productName) + ", ") + _local_2.daysToPeriodEnd) + ", ") + _local_2.memberPeriods) + ", ") + _local_2.periodsSubscribedAhead) + ", ") + _local_2.responseType));
            data.hcMember = (_local_2.daysToPeriodEnd > 0);
        }

        private function onRoomForward(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1132 = _SafeStr_127(_arg_1).getParser();
            _SafeStr_14.log(("Got room forward: " + _local_2.roomId));
            forwardToRoom(_local_2.roomId);
        }

        private function onConvertedRoomId(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1105 = _SafeStr_1010(_arg_1).getParser();
            if (_navigator.webRoomReport)
            {
                _navigator.habboHelp.reportRoom(_local_2.convertedId, _navigator.webRoomReportedName, "");
            }
            else
            {
                _SafeStr_14.log(((("Got converted room ID for " + _local_2.globalId) + ", forward to room ") + _local_2.convertedId));
                forwardToRoom(_local_2.convertedId);
            };
        }

        private function onNavigatorSettings(_arg_1:IMessageEvent):void
        {
            var _local_6:Boolean;
            var _local_4:Boolean;
            var _local_7:int;
            var _local_5:Boolean;
            var _local_2:_SafeStr_1184 = _SafeStr_466(_arg_1).getParser();
            _SafeStr_14.log(("Got navigator settings: " + _local_2.homeRoomId));
            var _local_3:* = (!(_navigator.data.settingsReceived));
            _navigator.data.homeRoomId = _local_2.homeRoomId;
            _navigator.data.settingsReceived = true;
            _navigator.mainViewCtrl.refresh();
            var _local_8:int = -1;
            var _local_9:int = -1;
            if (((_local_3) && (!(HabboComponentFlags.isRoomViewerMode(_navigator.flags)))))
            {
                _local_6 = false;
                _local_4 = false;
                if (_navigator.propertyExists("friend.id"))
                {
                    _local_8 = 0;
                    _navigator.send(new _SafeStr_428(_navigator.getProperty("friend.id")));
                };
                if (((_navigator.propertyExists("forward.type")) && (_navigator.propertyExists("forward.id"))))
                {
                    _local_8 = _navigator.getProperty("forward.type");
                    _local_9 = _navigator.getProperty("forward.id");
                };
                _local_4 = (_local_2.roomIdToEnter <= 0);
                if (_local_8 == 2)
                {
                    _SafeStr_14.log(("Guest room forward on enter: " + _local_9));
                    forwardToRoom(_local_9);
                }
                else
                {
                    if (_local_8 == -1)
                    {
                        if (!_local_4)
                        {
                            _local_7 = _local_2.roomIdToEnter;
                            if (_local_7 != _navigator.data.homeRoomId)
                            {
                                this._navigator.goToRoom(_local_7, true);
                            }
                            else
                            {
                                _local_5 = this._navigator.goToHomeRoom();
                                if (!_local_5)
                                {
                                    _local_6 = true;
                                };
                            };
                        };
                    };
                };
                if (((_local_6) && (!(_navigator.mainViewCtrl.isOpen()))))
                {
                    _navigator.mainViewCtrl.onNavigatorToolBarIconClick();
                };
            }
            else
            {
                _navigator.roomInfoViewCtrl.reload();
            };
        }

        private function onRoomExit(_arg_1:IMessageEvent):void
        {
            _SafeStr_14.log("Navigator: exiting room");
            data.onRoomExit();
            _navigator.roomInfoViewCtrl.close();
            _navigator.roomEventInfoCtrl.close();
            _navigator.roomEventViewCtrl.close();
            _navigator.roomSettingsCtrl.close();
            _navigator.roomFilterCtrl.close();
            var _local_2:Boolean = _navigator.getBoolean("news.auto_popup.enabled");
            if (_local_2)
            {
                HabboWebTools.openNews();
            };
        }

        private function onUserFlatCats(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1293 = (_arg_1 as _SafeStr_571).getParser();
            _navigator.data.categories = _local_3.nodes;
            var _local_2:RoomsTabPageDecorator = RoomsTabPageDecorator(_navigator.tabs.getTab(2).tabPageDecorator);
            _local_2.prepareRoomCategories();
        }

        private function onUserEventCats(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1059 = (_arg_1 as _SafeStr_499).getParser();
            _navigator.data.eventCategories = _local_2.eventCategories;
        }

        private function onRoomSettingsData(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            try
            {
                _local_2 = (_arg_1 as _SafeStr_724).getParser();
                _navigator.roomSettingsCtrl.onRoomSettings(_local_2.data);
                _SafeStr_14.log(((((("GOT ROOM SETTINGS DATA: " + _local_2.data.name) + ", ") + _local_2.data.maximumVisitors) + ", ") + _local_2.data.maximumVisitorsLimit));
            }
            catch(e:Error)
            {
                _SafeStr_14.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
            };
        }

        private function onRoomFilterSettings(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1172 = (_arg_1 as _SafeStr_551).getParser();
            _navigator.roomFilterCtrl.onRoomFilterSettings(_local_2.badWords);
            _SafeStr_14.log(("GOT ROOM FILTER SETTINGS: " + _local_2.badWords));
        }

        private function onRoomSettingsError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1211 = (_arg_1 as _SafeStr_311).getParser();
        }

        private function onRoomSettingsSaved(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1417 = (_arg_1 as _SafeStr_513).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ("Room settings saved: " + _local_2.roomId));
            _navigator.mainViewCtrl.reloadRoomList(5);
        }

        private function onRoomSettingsSaveError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1128 = (_arg_1 as _SafeStr_924).getParser();
            _navigator.roomSettingsCtrl.onRoomSettingsSaveError(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function onRoomInfoUpdated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1375 = (_arg_1 as _SafeStr_463).getParser();
            _SafeStr_14.log(("ROOM UPDATED: " + _local_2.flatId));
            _navigator.send(new _SafeStr_525(_local_2.flatId, false, false));
        }

        private function onFavourites(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1486 = (_arg_1 as _SafeStr_128).getParser();
            _navigator.data.onFavourites(_local_2);
        }

        private function onFavouriteChanged(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1354 = (_arg_1 as _SafeStr_717).getParser();
            _SafeStr_14.log(((("Received favourite changed: " + _local_2.flatId) + ", ") + _local_2.added));
            _navigator.data.favouriteChanged(_local_2.flatId, _local_2.added);
            _navigator.roomInfoViewCtrl.reload();
            _navigator.mainViewCtrl.refresh();
        }

        private function onCanCreateRoom(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1389 = (_arg_1 as _SafeStr_918).getParser();
            _SafeStr_14.log(((("Can create room: " + _local_3.resultCode) + ", ") + _local_3.roomLimit));
            if (_local_3.resultCode == 0)
            {
                _navigator.roomCreateViewCtrl.show();
            }
            else
            {
                _navigator.registerParameter("navigator.createroom.limitreached", "limit", ("" + _local_3.roomLimit));
                if (_navigator.sessionData.hasVip)
                {
                    _local_2 = new SimpleAlertView(_navigator, "${navigator.createroom.error}", "${navigator.createroom.limitreached}");
                }
                else
                {
                    _local_2 = new ClubPromoAlertView(_navigator, "${navigator.createroom.error}", "${navigator.createroom.limitreached}", "${navigator.createroom.vippromo}");
                };
                _local_2.show();
            };
        }

        private function onFlatControllers(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1110 = (_arg_1 as _SafeStr_678).getParser();
            _SafeStr_14.log(((("Got flat controllers: " + _local_2.roomId) + ", ") + _local_2.controllers.length));
            _navigator.roomSettingsCtrl.onFlatControllers(_local_2.roomId, _local_2.controllers);
        }

        private function onFlatControllerAdded(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1313 = (_arg_1 as _SafeStr_977).getParser();
            _SafeStr_14.log(((((("Flat controller added: " + _local_2.flatId) + ", ") + _local_2.data.userId) + ", ") + _local_2.data.userName));
            _navigator.roomSettingsCtrl.onFlatControllerAdded(_local_2.flatId, _local_2.data);
        }

        private function onFlatControllerRemoved(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1208 = (_arg_1 as _SafeStr_789).getParser();
            _SafeStr_14.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            _navigator.roomSettingsCtrl.onFlatControllerRemoved(_local_2.flatId, _local_2.userId);
        }

        private function onBannedUsersFromRoom(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1339 = (_arg_1 as _SafeStr_865).getParser();
            _SafeStr_14.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2.bannedUsers.length));
            _navigator.roomSettingsCtrl.onBannedUsersFromRoom(_local_2.roomId, _local_2.bannedUsers);
        }

        private function onUserUnbannedFromRoom(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1329 = (_arg_1 as _SafeStr_997).getParser();
            _SafeStr_14.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            _navigator.roomSettingsCtrl.onUserUnbannedFromRoom(_local_2.roomId, _local_2.userId);
        }

        private function onError(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var error:_SafeStr_461 = (event as _SafeStr_461);
            if (error == null)
            {
                return;
            };
            switch (error.getParser().errorCode)
            {
                case -100002:
                    _navigator.passwordInput.showRetry();
                    return;
                case 4009:
                    _navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.need.to.be.vip}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                    return;
                case 4010:
                    _navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.invalid_room_name}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                    return;
                case 4011:
                    _navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.cannot_perm_ban}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                    return;
                case 4013:
                    _navigator.windowManager.alert("${generic.alert.title}", "${navigator.alert.room_in_maintenance}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                    });
                    return;
            };
        }

        private function onDoorbell(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_787 = (_arg_1 as _SafeStr_787);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.userName != "")
            {
                return;
            };
            _navigator.doorbell.showWaiting();
        }

        private function onDoorOpened(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_346 = (_arg_1 as _SafeStr_346);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1418 = _local_3.getParser();
            if (((!(_local_2 == null)) && ((_local_2.userName == null) || (_local_2.userName.length == 0))))
            {
                _navigator.doorbell.hide();
            };
        }

        private function onRoomRating(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1424 = (_arg_1 as _SafeStr_703).getParser();
            _navigator.data.currentRoomRating = _local_2.rating;
            _navigator.data.canRate = _local_2.canRate;
            this._navigator.roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1438 = (_arg_1 as _SafeStr_972).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                _navigator.doorbell.showNoAnswer();
            };
        }

        private function onFriendsListFragment(_arg_1:IMessageEvent):void
        {
            _navigator.data.friendList.onFriendsListFragment(_arg_1);
        }

        private function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            _navigator.data.friendList.onFriendListUpdate(_arg_1);
            _navigator.roomSettingsCtrl.onFriendListUpdate();
        }

        private function onCompetitionData(_arg_1:_SafeStr_507):void
        {
            _navigator.data.competitionRoomsData = _arg_1.getParser().data;
        }

        private function forwardToRoom(_arg_1:int):void
        {
            _navigator.send(new _SafeStr_525(_arg_1, false, true));
            _navigator.trackNavigationDataPoint("Room Forward", "go.roomforward", "", _arg_1);
        }

        private function onNoOwnedRoomsAlert(_arg_1:_SafeStr_285):void
        {
            _navigator.startRoomCreation();
        }

        private function closeOpenCantConnectAlerts():void
        {
            var _local_1:* = null;
            var _local_7:* = null;
            var _local_4:int;
            var _local_5:int;
            var _local_6:* = null;
            var _local_3:* = null;
            if (_navigator != null)
            {
                _local_1 = [];
                _local_7 = _navigator.windowManager.getWindowContext(2);
                _local_4 = _local_7.getDesktopWindow().numChildren;
                _local_5 = 0;
                while (_local_5 < _local_4)
                {
                    _local_6 = _local_7.getDesktopWindow().getChildAt(_local_5);
                    if (_local_6.tags.indexOf("SimpleAlertView") > -1)
                    {
                        _local_1.push(_local_6);
                    };
                    _local_5++;
                };
                if (_local_1.length > 0)
                {
                    for each (var _local_2:_SafeStr_3109 in _local_1)
                    {
                        _local_3 = AlertView.findAlertView(_local_2);
                        if (_local_3 != null)
                        {
                            _local_3.dispose();
                        };
                    };
                };
            };
        }

        private function onCantConnect(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1338 = (_arg_1 as _SafeStr_823).getParser();
            _SafeStr_14.log(("FAILED TO CONNECT: REASON: " + _local_3.reason));
            switch (_local_3.reason)
            {
                case 1:
                    _local_2 = new SimpleAlertView(_navigator, "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _local_2.show();
                    break;
                case 3:
                    _local_2 = new SimpleAlertView(_navigator, "${room.queue.error.title}", (("${room.queue.error." + _local_3.parameter) + "}"));
                    _local_2.show();
                    break;
                case 4:
                    _local_2 = new SimpleAlertView(_navigator, "${navigator.banned.title}", "${navigator.banned.text}");
                    _local_2.show();
                    break;
                default:
                    _local_2 = new SimpleAlertView(_navigator, "${room.queue.error.title}", "${room.queue.error.title}");
                    _local_2.show();
            };
            _navigator.send(new _SafeStr_316());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent("HTE_TOOLBAR_CLICK");
            _local_4.iconId = "HTIE_ICON_RECEPTION";
            _navigator.toolbar.events.dispatchEvent(_local_4);
        }

        private function onEnforceRoomCategorySelection(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1485 = (_arg_1 as _SafeStr_966).getParser();
            _navigator.enforceCategoryCtrl.show(_local_2.selectionType);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1010 = "_-PL" (String#23625, DoABC#4)
// _SafeStr_1013 = "_-Z0" (String#19256, DoABC#4)
// _SafeStr_1050 = "_-Cq" (String#30007, DoABC#4)
// _SafeStr_1059 = "_-m1H" (String#28857, DoABC#4)
// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_1085 = "_-Jf" (String#30543, DoABC#4)
// _SafeStr_1105 = "_-X6" (String#31955, DoABC#4)
// _SafeStr_1110 = "_-Fl" (String#30394, DoABC#4)
// _SafeStr_1128 = "_-Kc" (String#30572, DoABC#4)
// _SafeStr_1132 = "_-57" (String#38438, DoABC#4)
// _SafeStr_1172 = "_-Y1I" (String#30186, DoABC#4)
// _SafeStr_1184 = "_-rq" (String#31656, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1208 = "_-w1j" (String#30567, DoABC#4)
// _SafeStr_1211 = "_-q14" (String#29390, DoABC#4)
// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_1264 = "_-U1Y" (String#30954, DoABC#4)
// _SafeStr_127 = "_-i1l" (String#23789, DoABC#4)
// _SafeStr_1274 = "_-I1o" (String#18905, DoABC#4)
// _SafeStr_128 = "_-G1b" (String#12320, DoABC#4)
// _SafeStr_1284 = "_-12L" (String#30967, DoABC#4)
// _SafeStr_1290 = "_-l1B" (String#29435, DoABC#4)
// _SafeStr_1293 = "_-315" (String#30224, DoABC#4)
// _SafeStr_1303 = "_-bd" (String#29931, DoABC#4)
// _SafeStr_1313 = "_-O1K" (String#30875, DoABC#4)
// _SafeStr_1329 = "_-w17" (String#30362, DoABC#4)
// _SafeStr_1338 = "_-x2" (String#28647, DoABC#4)
// _SafeStr_1339 = "_-ey" (String#30462, DoABC#4)
// _SafeStr_1354 = "_-d1" (String#30123, DoABC#4)
// _SafeStr_1375 = "_-sS" (String#28980, DoABC#4)
// _SafeStr_1389 = "_-X1J" (String#36721, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1417 = "_-D1n" (String#30586, DoABC#4)
// _SafeStr_1418 = "_-n19" (String#24362, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1424 = "_-RL" (String#31135, DoABC#4)
// _SafeStr_1438 = "_-1v" (String#22414, DoABC#4)
// _SafeStr_1485 = "_-vb" (String#34287, DoABC#4)
// _SafeStr_1486 = "_-3O" (String#24369, DoABC#4)
// _SafeStr_1512 = "_-71o" (String#27838, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1621 = "_-MK" (String#13817, DoABC#4)
// _SafeStr_1634 = "_-I1T" (String#11183, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_285 = "_-tX" (String#12581, DoABC#4)
// _SafeStr_288 = "_-k1Z" (String#12190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_311 = "_-026" (String#12669, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_316 = "_-hs" (String#6384, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_346 = "_-Z6" (String#6604, DoABC#4)
// _SafeStr_373 = "_-U1c" (String#6702, DoABC#4)
// _SafeStr_400 = "_-cw" (String#15162, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_428 = "_-5Z" (String#7229, DoABC#4)
// _SafeStr_432 = "_-uV" (String#12292, DoABC#4)
// _SafeStr_444 = "_-l5" (String#13440, DoABC#4)
// _SafeStr_461 = "_-Q17" (String#7013, DoABC#4)
// _SafeStr_463 = "_-G1u" (String#12314, DoABC#4)
// _SafeStr_466 = "_-BT" (String#13142, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_499 = "_-s1j" (String#11707, DoABC#4)
// _SafeStr_507 = "_-q1U" (String#12607, DoABC#4)
// _SafeStr_513 = "_-M1S" (String#8781, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_551 = "_-vR" (String#11714, DoABC#4)
// _SafeStr_571 = "_-X11" (String#11722, DoABC#4)
// _SafeStr_591 = "_-S1g" (String#12383, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_678 = "_-32B" (String#11905, DoABC#4)
// _SafeStr_682 = "_-k1M" (String#12474, DoABC#4)
// _SafeStr_703 = "_-q16" (String#13017, DoABC#4)
// _SafeStr_707 = "_-S14" (String#22054, DoABC#4)
// _SafeStr_717 = "_-S1l" (String#12160, DoABC#4)
// _SafeStr_724 = "_-ds" (String#12992, DoABC#4)
// _SafeStr_748 = "_-m1e" (String#8180, DoABC#4)
// _SafeStr_781 = "_-81h" (String#19788, DoABC#4)
// _SafeStr_787 = "_-9t" (String#5939, DoABC#4)
// _SafeStr_789 = "_-No" (String#13138, DoABC#4)
// _SafeStr_823 = "_-sE" (String#12148, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)
// _SafeStr_865 = "_-Z1f" (String#12165, DoABC#4)
// _SafeStr_876 = "_-Dm" (String#12920, DoABC#4)
// _SafeStr_903 = "_-80" (String#9168, DoABC#4)
// _SafeStr_918 = "_-31n" (String#23315, DoABC#4)
// _SafeStr_924 = "_-01X" (String#12393, DoABC#4)
// _SafeStr_934 = "_-cF" (String#19049, DoABC#4)
// _SafeStr_966 = "_-DL" (String#22979, DoABC#4)
// _SafeStr_972 = "_-aI" (String#6424, DoABC#4)
// _SafeStr_977 = "_-Wo" (String#11628, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)
// _SafeStr_997 = "_-h17" (String#11663, DoABC#4)


