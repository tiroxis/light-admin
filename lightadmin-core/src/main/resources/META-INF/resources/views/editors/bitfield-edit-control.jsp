<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="attributeMetadata" type="org.springframework.data.mapping.PersistentProperty" scope="request"/>

<c:forEach var="element" varStatus="loop" items="${elements}">
    <label><input type="checkbox" id="check-${element.label}" name="${element.label}" value="${element.value}"/>${element.label}</label>
</c:forEach>
<input id="${attributeMetadata.name}" name="${attributeMetadata.name}" type="text" style="display: none"/>

<script type="text/javascript">

    $(function() {
        setupCheckboxes();
    });

    function setupCheckboxes() {
        var value = $("#${attributeMetadata.name}").val();
        if (value) {
            <c:forEach var="element" items="${elements}">
                var checkbox = $("#check-${element.label}");
                var checkboxValue = parseInt(checkbox.val());

                var shouldBeChecked = (parseInt(value) & checkboxValue) === checkboxValue;

                if (shouldBeChecked) {
                    checkbox.prop("checked", true);
                    checkbox.parent().toggleClass("checked");
                }
            </c:forEach>
        } else {
            setTimeout(function () {
                setupCheckboxes();
            }, 50);
        }
    }

    <c:forEach var="element" items="${elements}">
        $("#check-${element.label}").change(function () {
            var input = $("#${attributeMetadata.name}");
            var inputValue = input.val();

            var newValue = parseInt(inputValue) + (this.checked ? 1 : -1) * this.value;

            input.val(newValue);
        });
    </c:forEach>
</script>