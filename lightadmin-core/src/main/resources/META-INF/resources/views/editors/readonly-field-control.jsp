<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="attributeMetadata" type="org.springframework.data.mapping.PersistentProperty"
             scope="request"/>
<input type="text" id="${attributeMetadata.name}" name="${attributeMetadata.name}" readonly>
</input>