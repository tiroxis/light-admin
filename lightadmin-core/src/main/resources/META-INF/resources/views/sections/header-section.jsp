<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="light" uri="http://www.lightadmin.org/tags" %>

<tiles:importAttribute name="domainTypeAdministrationConfiguration" ignore="true"/>
<tiles:importAttribute name="entityId" ignore="true"/>

<spring:message code="to.dashboard" var="to_dashboard"/>
<div id="header" class="wrapper">
	<div class="logo">
		<a href="<light:url value='/'/>" title="${to_dashboard}">
			<img src="<light:url value='/dynamic/logo'/>"/>
		</a>
	</div>
	<div class="middleNav">
		<c:if test="${not empty domainTypeAdministrationConfiguration}">
			<ul>
				<c:if test="${not empty entityId}">
					<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Activity'
								or domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Offer'
								or domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'TicketCategory'}">
						<li class="iCopy">
							<a>
								<span>Duplicate</span>
							</a>
						</li>
					</c:if>
				</c:if>
				<li class="iCreate">
					<a href="<light:url value='${light:domainBaseUrl(domainTypeAdministrationConfiguration)}'/>/create">
						<span>Create New</span>
					</a>
				</li>
				<%--<li class="iArchive"><a href="#" class="not-implemented" title=""><span>Templates</span></a></li>--%>
				<%--<li class="iZipFiles"><a href="#" class="not-implemented" title=""><span>Export Data</span></a></li>--%>
			</ul>
		</c:if>
	</div>
	<div class="fix"></div>
</div>

<c:if test="${not empty domainTypeAdministrationConfiguration and not empty entityId}">
	<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Activity'}">
		<div id="duplicate-dialog" title="Duplicate Activity" style="display: none">
			<label>
				Select copy mode:
				<select id="copy-mode-select">
					<option value="simple">Simple</option>
					<option value="deep">Deep</option>
				</select>
			</label>

			<p id="copy-mode-hint-simple">
				Simple copying an 'Activity' will NOT copy attached 'Offers' and 'TicketCategories'.
			</p>
			<p id="copy-mode-hint-deep" style="display: none;">
				Deep copying an 'Activity' causes the attached 'Offers', and 'TicketCategories' to be recreated as well.
			</p>
		</div>
	</c:if>

	<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Offer'}">
		<div id="duplicate-dialog" title="Duplicate Offer" style="display: none">
			<label>
				Select copy mode:
				<select id="copy-mode-select">
					<option value="simple">Simple</option>
					<option value="deep">Deep</option>
				</select>
			</label>

			<p id="copy-mode-hint-simple">
				Simple copying an 'Offer' will NOT copy attached 'TicketCategories'.
			</p>
			<p id="copy-mode-hint-deep" style="display: none;">
				Deep copying an 'Offer' causes the attached 'TicketCategories' to be recreated as well.
			</p>
		</div>
	</c:if>

	<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'TicketCategory'}">
		<div id="duplicate-dialog" title="Duplicate TicketCategory" style="display: none">
			<label>
				Select copy mode:
				<select id="copy-mode-select" disabled="disabled">
					<option value="simple">Simple</option>
				</select>
			</label>

			<p id="copy-mode-hint-simple">
				Creates a copy of this TicketCategory.
			</p>
		</div>
	</c:if>

	<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Activity'
					or domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Offer'
					or domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'TicketCategory'}">
		<script type="text/javascript">
			$("#copy-mode-select").change(function() {
				var val = $(this).val();

				if (val === "simple") {
					$("#copy-mode-hint-simple").css("display", "block");
					$("#copy-mode-hint-deep").css("display", "none");
				} else {
					$("#copy-mode-hint-simple").css("display", "none");
					$("#copy-mode-hint-deep").css("display", "block");
				}
			});

            $(".iCopy").click(function() {
                $("#duplicate-dialog").dialog({
                    buttons: [{
                        text: "Cancel",
                        class: "basicBtn",
                        click: function() {$(this).dialog("close");}
                    },
                        {
                            text: "Copy",
                            class: "blueBtn",
								click: function() {
                                    var url = "";
									<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Activity'}">
										url = "/activities/" + ${entityId} + "/copy?mode=" + $("#copy-mode-select").val();
									</c:if>
									<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'Offer'}">
										url = "/offers/" + ${entityId} + "/copy?mode=" + $("#copy-mode-select").val();
									</c:if>
									<c:if test="${domainTypeAdministrationConfiguration.getDomainType().getSimpleName() eq 'TicketCategory'}">
										url = "/ticketcategories/" + ${entityId} + "/copy";
									</c:if>
								    var onSuccess = function(data) {
                                        window.location.href = "<light:url value='${light:domainBaseUrl(domainTypeAdministrationConfiguration)}'/>/" + data.id;
                                    };

								    $.post(url, onSuccess);
								}
                        }
                    ],
                    open: function() {
                        $('.ui-dialog-buttonset').css("text-align", "right");
                    }
                });
            });
		</script>
	</c:if>
</c:if>